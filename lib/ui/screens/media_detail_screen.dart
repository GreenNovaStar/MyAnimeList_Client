import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/data/model/anime_details.dart';
import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/genre.dart';
import 'package:android_app/data/model/manga_details.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/data/model/my_list_status.dart';
import 'package:android_app/data/model/node.dart';
import 'package:android_app/data/model/themes.dart';
import 'package:android_app/providers/detail_provider.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:android_app/providers/title_language_provider.dart';
import 'package:android_app/ui/components/anime_rail.dart';
import 'package:android_app/ui/components/media_list_editor.dart';
import 'package:android_app/ui/components/nova/nova_poster_image.dart';
import 'package:android_app/ui/components/nova/nova_score.dart';
import 'package:android_app/ui/components/nova/nova_skeleton.dart';
import 'package:android_app/utils/constants/color.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:android_app/utils/extension_methods/node_extension.dart';
import 'package:android_app/utils/extension_methods/string_extension.dart';
import 'package:android_app/utils/formatters/episode_label.dart';
import 'package:android_app/utils/formatters/media_type_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Everything the detail body renders, flattened from either [AnimeDetails]
/// or [MangaDetails] so the widget tree below has a single build path.
typedef _DetailView = ({
  double? mean,
  List<String> metaChips,
  String? synopsis,
  List<Genres>? genres,
  String creatorsLabel, // "Studios" (anime) / "Authors" (manga)
  String? creators,
  List<(String, String)> info,
  List<Themes>? openingThemes,
  List<Themes>? endingThemes,
  MyListStatus? myListStatus,
  int? progressTotal, // episodes (anime) or chapters (manga), for the editor
  List<Data> relatedAnime,
  List<Data> relatedManga,
  List<Data> recommendations,
});

/// Related/recommendation entries carry a bare node; wrap them in the [Data]
/// envelope the rail components render.
List<Data> _railData(Iterable<Node?>? nodes) => [
  for (final node in nodes ?? const <Node?>[])
    if (node != null) Data(node: node),
];

_DetailView _viewOfAnime(AnimeDetails d) => (
  mean: d.mean,
  metaChips: [
    if (episodeCountLabel(d.numEpisodes) case final String label) label,
    if (d.status != null) d.status!.prettifyString(),
    if (d.rating != null) d.rating!.toUpperCase(),
  ],
  synopsis: d.synopsis,
  genres: d.genres,
  creatorsLabel: 'Studios',
  creators: (d.studios?.isNotEmpty ?? false)
      ? d.studios!.map((s) => s.name).join(', ')
      : null,
  info: [
    if (d.mediaType != null)
      ('Type', mediaTypeLabel(d.mediaType!) ?? d.mediaType!),
    if (d.numEpisodes != null) ('Episodes', d.numEpisodes.toString()),
    if (episodeDurationLabel(d.averageEpisodeDuration)
        case final String duration)
      ('Duration', duration),
    if (d.source != null) ('Source', d.source!.prettifyString()),
    if (d.startDate != null) ('Aired', d.startDate!),
    if (d.rank != null) ('Rank', '#${d.rank}'),
    if (d.popularity != null) ('Popularity', '#${d.popularity}'),
  ],
  openingThemes: d.openingThemes,
  endingThemes: d.endingThemes,
  myListStatus: d.myListStatus,
  progressTotal: d.numEpisodes,
  relatedAnime: _railData(d.relatedAnime?.map((r) => r.node)),
  relatedManga: const [],
  recommendations: _railData(d.recommendations?.map((r) => r.node)),
);

_DetailView _viewOfManga(MangaDetails d) => (
  mean: d.mean,
  metaChips: [
    if (d.numChapters != null && d.numChapters! > 0) '${d.numChapters} ch',
    if (d.status != null) d.status!.prettifyString(),
  ],
  synopsis: d.synopsis,
  genres: d.genres,
  creatorsLabel: 'Authors',
  creators: (d.authors?.isNotEmpty ?? false)
      ? d.authors!
            .map((a) {
              final name = [
                a.node?.firstName,
                a.node?.lastName,
              ].nonNulls.join(' ').trim();
              return a.role != null && a.role!.isNotEmpty
                  ? '$name (${a.role})'
                  : name;
            })
            .join(', ')
      : null,
  info: [
    if (d.mediaType != null)
      ('Type', mediaTypeLabel(d.mediaType!) ?? d.mediaType!),
    if (d.numChapters != null && d.numChapters! > 0)
      ('Chapters', d.numChapters.toString()),
    if (d.numVolumes != null && d.numVolumes! > 0)
      ('Volumes', d.numVolumes.toString()),
    if (d.startDate != null) ('Published', d.startDate!),
    if (d.serialization?.isNotEmpty ?? false)
      ('Serialization', d.serialization!.join(', ')),
    if (d.rank != null) ('Rank', '#${d.rank}'),
    if (d.popularity != null) ('Popularity', '#${d.popularity}'),
  ],
  openingThemes: null,
  endingThemes: null,
  myListStatus: d.myListStatus,
  progressTotal: d.numChapters,
  relatedAnime: _railData(d.relatedAnime?.map((r) => r.node)),
  relatedManga: _railData(d.relatedManga?.map((r) => r.node)),
  recommendations: _railData(d.recommendations?.map((r) => r.node)),
);

/// Detail screen for a single anime or manga: poster hero, score/meta chips,
/// synopsis, genres, studios/authors, info table, (anime) theme songs, and
/// related/recommended rails that push further detail screens.
/// Signed-in users get a FAB that opens the list-entry editor.
class MediaDetailScreen extends ConsumerStatefulWidget {
  final Data data;
  final MediaKind kind;

  const MediaDetailScreen({
    super.key,
    required this.data,
    this.kind = MediaKind.anime,
  });

  @override
  ConsumerState<MediaDetailScreen> createState() => _MediaDetailScreenState();
}

class _MediaDetailScreenState extends ConsumerState<MediaDetailScreen> {
  /// Set after the editor saves/deletes; overrides the fetched list status
  /// (null is meaningful — a deleted entry — hence the separate flag).
  MyListStatus? _localStatus;
  bool _statusEdited = false;

  int get _id => widget.data.node.id!;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final String imageUrl = widget.data.node.posterUrl;
    final String title = widget.data.node.displayTitle(
      preferEnglish: ref.watch(preferEnglishTitlesProvider),
    );
    final client = ref.watch(malClientProvider);

    final AsyncValue<_DetailView> detailsAsync = switch (widget.kind) {
      MediaKind.anime =>
        ref.watch(animeDetailProvider(_id)).whenData(_viewOfAnime),
      MediaKind.manga =>
        ref.watch(mangaDetailProvider(_id)).whenData(_viewOfManga),
    };
    final details = detailsAsync.valueOrNull;
    final listStatus = _statusEdited ? _localStatus : details?.myListStatus;

    return Scaffold(
      floatingActionButton: client is MALUserClient
          ? FloatingActionButton(
              onPressed: () => _openListEditor(client, details, listStatus),
              child: listStatus != null
                  ? const Icon(Icons.favorite_rounded)
                  : const Icon(Icons.favorite_border_rounded),
            )
          : null,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                title,
                style: NovaType.title.copyWith(color: NovaColors.onScrim),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              background: imageUrl.isNotEmpty
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        NovaPosterImage(url: imageUrl),
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black87],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(color: scheme.surfaceContainerHighest),
            ),
          ),
          SliverToBoxAdapter(
            child: detailsAsync.when(
              loading: () => _buildSkeleton(),
              error: (error, _) => Padding(
                padding: const EdgeInsets.all(NovaSize.spaceLg),
                child: Text(
                  "Failed to load details.",
                  style: NovaType.body.copyWith(color: scheme.error),
                ),
              ),
              data: (details) => _buildDetails(context, details),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openListEditor(
    MALUserClient client,
    _DetailView? details,
    MyListStatus? listStatus,
  ) async {
    final result = await MediaListEditor.show(
      context,
      id: _id,
      kind: widget.kind,
      client: client,
      progressTotal: details?.progressTotal,
      currentStatus: listStatus,
    );
    // null = sheet dismissed without saving; keep whatever we had.
    if (result != null && mounted) {
      setState(() {
        _localStatus = result.status;
        _statusEdited = true;
      });
    }
  }

  Widget _buildSkeleton() {
    return Padding(
      padding: const EdgeInsets.all(NovaSize.spaceLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NovaSkeleton(width: 80, height: 20),
          const SizedBox(height: NovaSize.spaceMd),
          const NovaSkeleton(width: double.infinity, height: 14),
          const SizedBox(height: NovaSize.spaceSm),
          const NovaSkeleton(width: double.infinity, height: 14),
          const SizedBox(height: NovaSize.spaceSm),
          const NovaSkeleton(width: 200, height: 14),
          const SizedBox(height: NovaSize.spaceLg),
          const NovaSkeleton(width: 120, height: 20),
          const SizedBox(height: NovaSize.spaceMd),
          Row(
            children: List.generate(
              4,
              (_) => const Padding(
                padding: EdgeInsets.only(right: NovaSize.spaceSm),
                child: NovaSkeleton(
                  width: 70,
                  height: 32,
                  radius: NovaSize.radiusPill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context, _DetailView details) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    // The related rails sit outside the text padding: AnimeRail brings its
    // own section header and horizontal padding, and its tiles should scroll
    // edge-to-edge.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(NovaSize.spaceLg),
          child: _buildTextSections(scheme, details),
        ),
        ..._relatedRail(
          context,
          "Related Anime",
          details.relatedAnime,
          MediaKind.anime,
        ),
        ..._relatedRail(
          context,
          "Related Manga",
          details.relatedManga,
          MediaKind.manga,
        ),
        ..._relatedRail(
          context,
          "Recommendations",
          details.recommendations,
          widget.kind,
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildTextSections(ColorScheme scheme, _DetailView details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            NovaScore(score: details.mean),
            const SizedBox(width: NovaSize.spaceLg),
            for (final chip in details.metaChips) _metaChip(scheme, chip),
          ],
        ),

        if (details.synopsis != null && details.synopsis!.isNotEmpty)
          ..._section(scheme, "Synopsis", [
            Text(
              details.synopsis!,
              style: NovaType.body.copyWith(color: scheme.onSurfaceVariant),
            ),
          ]),

        if (details.genres != null && details.genres!.isNotEmpty)
          ..._section(scheme, "Genres", [
            Wrap(
              spacing: NovaSize.spaceSm,
              runSpacing: NovaSize.spaceSm,
              children: details.genres!
                  .map(
                    (g) => Chip(
                      label: Text(g.name ?? ''),
                      visualDensity: VisualDensity.compact,
                    ),
                  )
                  .toList(),
            ),
          ]),

        if (details.creators != null)
          ..._section(scheme, details.creatorsLabel, [
            Text(
              details.creators!,
              style: NovaType.body.copyWith(color: scheme.onSurfaceVariant),
            ),
          ]),

        ..._section(scheme, "Information", [_infoTable(scheme, details.info)]),

        if (details.openingThemes != null && details.openingThemes!.isNotEmpty)
          ..._section(
            scheme,
            "Opening Themes",
            _themeLines(scheme, details.openingThemes!),
          ),

        if (details.endingThemes != null && details.endingThemes!.isNotEmpty)
          ..._section(
            scheme,
            "Ending Themes",
            _themeLines(scheme, details.endingThemes!),
          ),
      ],
    );
  }

  /// A horizontal rail of related/recommended titles; nothing when empty.
  List<Widget> _relatedRail(
    BuildContext context,
    String title,
    List<Data> items,
    MediaKind kind,
  ) {
    if (items.isEmpty) return const [];
    return [
      const SizedBox(height: NovaSize.spaceLg),
      AnimeRail(
        title: title,
        items: items,
        onTap: (d) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MediaDetailScreen(data: d, kind: kind),
          ),
        ),
      ),
    ];
  }

  /// A titled section: top spacing, headline, small gap, then [children].
  /// Spread into the parent Column (`..._section(...)`).
  List<Widget> _section(
    ColorScheme scheme,
    String title,
    List<Widget> children,
  ) {
    return [
      const SizedBox(height: NovaSize.spaceLg),
      Text(title, style: NovaType.headline.copyWith(color: scheme.onSurface)),
      const SizedBox(height: NovaSize.spaceSm),
      ...children,
    ];
  }

  /// One caption line per opening/ending theme song.
  List<Widget> _themeLines(ColorScheme scheme, List<Themes> themes) {
    return themes
        .map(
          (t) => Padding(
            padding: const EdgeInsets.only(bottom: NovaSize.spaceXs),
            child: Text(
              t.text ?? '',
              style: NovaType.caption.copyWith(color: scheme.onSurfaceVariant),
            ),
          ),
        )
        .toList();
  }

  Widget _metaChip(ColorScheme scheme, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: NovaSize.spaceSm),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: NovaSize.spaceSm,
          vertical: NovaSize.spaceXs,
        ),
        decoration: BoxDecoration(
          color: scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(NovaSize.radiusPill),
        ),
        child: Text(
          text,
          style: NovaType.label.copyWith(color: scheme.onSurfaceVariant),
        ),
      ),
    );
  }

  Widget _infoTable(ColorScheme scheme, List<(String, String)> entries) {
    return Column(
      children: entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: NovaSize.spaceXs),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      e.$1,
                      style: NovaType.label.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      e.$2,
                      style: NovaType.body.copyWith(color: scheme.onSurface),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
