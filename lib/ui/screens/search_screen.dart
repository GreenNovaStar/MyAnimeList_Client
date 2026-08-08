import 'dart:async';

import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/providers/media_mode_provider.dart';
import 'package:android_app/providers/search_provider.dart';
import 'package:android_app/ui/components/anime_list_row.dart';
import 'package:android_app/ui/components/nova/nova_empty_state.dart';
import 'package:android_app/ui/components/nova/nova_skeleton.dart';
import 'package:android_app/ui/screens/media_detail_screen.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// MAL's minimum search query length; shorter queries return 400.
const int _minQueryLength = 3;

const Duration _debounce = Duration(milliseconds: 400);

/// Search across MAL for the app's current media mode (anime or manga). The
/// query field debounces into a provider-family lookup, so results are cached
/// per (kind, query) and switching mode re-runs the current query against the
/// other media type. Works for guests and signed-in users (rows show list
/// status when signed in).
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounceTimer;

  /// The query actually being searched (set after the debounce), or '' when
  /// idle.
  String _query = '';

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String text) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounce, () {
      setState(() => _query = text.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final kind = ref.watch(mediaModeProvider);
    final medium = kind == MediaKind.anime ? 'anime' : 'manga';

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          textInputAction: TextInputAction.search,
          onChanged: _onChanged,
          decoration: InputDecoration(
            hintText: 'Search $medium...',
            border: InputBorder.none,
            suffixIcon: _controller.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _debounceTimer?.cancel();
                      _controller.clear();
                      setState(() => _query = '');
                    },
                  ),
          ),
          style: TextStyle(color: scheme.onSurface),
        ),
      ),
      body: _Results(kind: kind, query: _query),
    );
  }
}

/// The current query's results: prompt/skeleton/error/empty/list states with
/// infinite scroll.
class _Results extends ConsumerStatefulWidget {
  final MediaKind kind;
  final String query;

  const _Results({required this.kind, required this.query});

  @override
  ConsumerState<_Results> createState() => _ResultsState();
}

class _ResultsState extends ConsumerState<_Results> {
  SearchKey get _key => (kind: widget.kind, query: widget.query);

  @override
  Widget build(BuildContext context) {
    if (widget.query.length < _minQueryLength) {
      return NovaEmptyState(
        icon: Icons.search_rounded,
        message: widget.query.isEmpty
            ? 'Search MyAnimeList.'
            : 'Type at least $_minQueryLength characters.',
      );
    }

    final resultsAsync = ref.watch(searchProvider(_key));

    return resultsAsync.when(
      loading: () => _buildSkeleton(),
      error: (error, _) => NovaEmptyState(
        icon: Icons.cloud_off_rounded,
        message: "Search failed.\nCheck your connection and try again.",
        actionLabel: 'Retry',
        onAction: () => ref.invalidate(searchProvider(_key)),
      ),
      data: (results) => _buildResults(results),
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

  Widget _buildResults(SearchState results) {
    if (results.items.isEmpty) {
      return NovaEmptyState(
        icon: Icons.search_off_rounded,
        message: 'No results for "${widget.query}".',
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (results.hasMore &&
            notification.metrics.extentAfter < 600 &&
            notification is ScrollUpdateNotification) {
          ref.read(searchProvider(_key).notifier).loadMore();
        }
        return false;
      },
      child: ListView.builder(
        // Dismiss the keyboard once the user starts browsing results.
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(
          horizontal: NovaSize.spaceSm,
          vertical: NovaSize.spaceSm,
        ),
        itemCount: results.items.length + (results.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= results.items.length) {
            return const Padding(
              padding: EdgeInsets.all(NovaSize.spaceMd),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final item = results.items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: NovaSize.spaceXs),
            child: AnimeListRow(data: item, onTap: () => _openDetail(item)),
          );
        },
      ),
    );
  }

  void _openDetail(Data data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MediaDetailScreen(data: data, kind: widget.kind),
      ),
    );
  }
}
