import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/list_status_type.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:android_app/providers/my_list_provider.dart';
import 'package:android_app/ui/components/anime_list_row.dart';
import 'package:android_app/ui/components/media_list_editor.dart';
import 'package:android_app/ui/components/nova/nova_empty_state.dart';
import 'package:android_app/ui/components/nova/nova_error_snackbar.dart';
import 'package:android_app/ui/components/nova/nova_skeleton.dart';
import 'package:android_app/ui/screens/media_detail_screen.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// One status tab: its wire value (null = all) and display label.
typedef _StatusTabSpec = ({String? value, String label});

/// The signed-in user's anime or manga list, organized as one tab per watch/
/// read status (All + the five MAL statuses for that media type). Each tab is
/// an infinite-scrolling list of [AnimeListRow]s, backed by its own provider
/// family instance so switching tabs keeps each list's loaded pages. A sort
/// menu in the app bar applies across every tab (defaults to last updated).
/// Tapping an anime row opens the detail screen; returning refreshes every
/// tab (a status edit moves entries between tabs).
class MyListScreen extends StatefulWidget {
  final MediaKind kind;

  const MyListScreen({super.key, required this.kind});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  ListSort _sort = ListSort.listUpdatedAt;

  MediaKind get kind => widget.kind;

  String get _title => switch (kind) {
    MediaKind.anime => 'My Anime List',
    MediaKind.manga => 'My Manga List',
  };

  /// Tab order: All first, then MAL's status order for this media type.
  List<_StatusTabSpec> get _tabs => [
    (value: null, label: 'All'),
    ...switch (kind) {
      MediaKind.anime => AnimeListStatus.values.map(
        (s) => (value: s.value, label: s.label),
      ),
      MediaKind.manga => MangaListStatus.values.map(
        (s) => (value: s.value, label: s.label),
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final tabs = _tabs;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: [
            PopupMenuButton<ListSort>(
              icon: const Icon(Icons.sort),
              tooltip: 'Sort',
              initialValue: _sort,
              onSelected: (sort) => setState(() => _sort = sort),
              itemBuilder: (context) => [
                for (final sort in ListSort.forKind(kind))
                  PopupMenuItem(value: sort, child: Text(sort.label)),
              ],
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [for (final tab in tabs) Tab(text: tab.label)],
          ),
        ),
        body: TabBarView(
          children: [
            for (final tab in tabs)
              _StatusTab(
                kind: kind,
                statusValue: tab.value,
                label: tab.label,
                sort: _sort,
              ),
          ],
        ),
      ),
    );
  }
}

/// One status tab: skeleton -> error -> list states for a single filter.
/// Kept alive while off-screen so each tab retains its loaded pages and
/// scroll position (TabBarView otherwise disposes non-adjacent tabs, which
/// would tear down the autoDispose provider).
class _StatusTab extends ConsumerStatefulWidget {
  final MediaKind kind;
  final String? statusValue;
  final String label;
  final ListSort sort;

  const _StatusTab({
    required this.kind,
    required this.statusValue,
    required this.label,
    required this.sort,
  });

  @override
  ConsumerState<_StatusTab> createState() => _StatusTabState();
}

class _StatusTabState extends ConsumerState<_StatusTab>
    with AutomaticKeepAliveClientMixin {
  MyListKey get _key =>
      (kind: widget.kind, status: widget.statusValue, sort: widget.sort.value);

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final listAsync = ref.watch(myListProvider(_key));

    return listAsync.when(
      loading: () => _buildSkeleton(),
      error: (error, _) => NovaEmptyState(
        icon: Icons.cloud_off_rounded,
        message:
            "Couldn't load your list.\nCheck your connection and try again.",
        actionLabel: 'Retry',
        onAction: () => ref.invalidate(myListProvider(_key)),
      ),
      data: (list) => _buildList(list),
    );
  }

  Widget _buildSkeleton() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: NovaSize.spaceSm,
        vertical: NovaSize.spaceSm,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: NovaSize.spaceXs),
        child: NovaSkeleton(width: double.infinity, height: 130),
      ),
    );
  }

  Widget _buildList(MyListState list) {
    if (list.items.isEmpty) {
      final medium = widget.kind == MediaKind.anime ? 'anime' : 'manga';
      return NovaEmptyState(
        icon: widget.kind == MediaKind.anime
            ? Icons.video_library_outlined
            : Icons.menu_book_outlined,
        message: widget.statusValue == null
            ? "Your list is empty.\nAdd $medium from their detail page."
            : "Nothing in ${widget.label} yet.",
      );
    }

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(myListProvider(_key)),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          // Fetch the next page as the user nears the bottom.
          if (list.hasMore &&
              notification.metrics.extentAfter < 600 &&
              notification is ScrollUpdateNotification) {
            ref.read(myListProvider(_key).notifier).loadMore();
          }
          return false;
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: NovaSize.spaceSm,
            vertical: NovaSize.spaceSm,
          ),
          itemCount: list.items.length + (list.hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= list.items.length) {
              return const Padding(
                padding: EdgeInsets.all(NovaSize.spaceMd),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final item = list.items[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: NovaSize.spaceXs),
              child: AnimeListRow(
                data: item,
                onTap: () => _openDetail(item),
                onLongPress: () => _quickEdit(item),
                progressLabel: _progressLabel(item),
                onIncrement: _isInProgress(item)
                    ? () => _increment(item)
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }

  bool get _isAnime => widget.kind == MediaKind.anime;

  /// Current/total progress for this entry ("3/12", "3" when the total is
  /// unknown, null when nothing has been logged).
  String? _progressLabel(Data data) {
    final status = data.listStatus;
    final current = _isAnime
        ? status?.numEpisodesWatched
        : status?.numChaptersRead;
    if (current == null || current == 0) return null;
    final total = _isAnime ? data.node.numEpisodes : data.node.numChapters;
    return (total != null && total > 0) ? '$current/$total' : '$current';
  }

  /// Whether the +1 button applies: entry is currently being watched/read.
  bool _isInProgress(Data data) {
    final status = data.listStatus?.status;
    return status == 'watching' || status == 'reading';
  }

  /// Logs one more episode/chapter and patches the row in place.
  Future<void> _increment(Data data) async {
    final client = ref.read(malClientProvider);
    if (client is! MALUserClient) return;
    final id = data.node.id!;
    final current = _isAnime
        ? data.listStatus?.numEpisodesWatched ?? 0
        : data.listStatus?.numChaptersRead ?? 0;
    try {
      final updated = _isAnime
          ? await client.updateMyAnimeListStatus(
              id,
              numWatchedEpisodes: current + 1,
            )
          : await client.updateMyMangaListStatus(
              id,
              numChaptersRead: current + 1,
            );
      ref.read(myListProvider(_key).notifier).patchEntry(id, updated);
    } catch (e) {
      if (mounted) showNovaErrorSnackbar(context, e);
    }
  }

  /// Long-press: open the list editor directly, skipping the detail screen.
  Future<void> _quickEdit(Data data) async {
    final client = ref.read(malClientProvider);
    if (client is! MALUserClient) return;
    final result = await MediaListEditor.show(
      context,
      id: data.node.id!,
      kind: widget.kind,
      client: client,
      progressTotal: _isAnime ? data.node.numEpisodes : data.node.numChapters,
      currentStatus: data.listStatus,
    );
    if (result == null || !mounted) return; // dismissed without saving
    // A status change moves the entry between tabs; a delete removes it.
    // Refreshing every tab keeps them all consistent.
    ref.invalidate(myListProvider);
  }

  Future<void> _openDetail(Data data) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MediaDetailScreen(data: data, kind: widget.kind),
      ),
    );
    if (!mounted) return;
    // The detail screen's editor may have changed status/score/episodes.
    // A status change moves the entry between tabs, so refresh them all.
    ref.invalidate(myListProvider);
  }
}
