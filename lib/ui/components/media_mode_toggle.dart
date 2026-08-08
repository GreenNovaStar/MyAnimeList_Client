import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/providers/media_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The app-wide Anime/Manga mode switch, sized for an AppBar title slot.
/// Deliberately labeled (not an icon toggle) so the current mode is always
/// visible — a hidden mode makes "where did my manga list go?" a bug report.
class MediaModeToggle extends ConsumerWidget {
  const MediaModeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(mediaModeProvider);

    return SegmentedButton<MediaKind>(
      segments: const [
        ButtonSegment(
          value: MediaKind.anime,
          label: Text('Anime'),
          icon: Icon(Icons.movie_outlined),
        ),
        ButtonSegment(
          value: MediaKind.manga,
          label: Text('Manga'),
          icon: Icon(Icons.menu_book_outlined),
        ),
      ],
      selected: {mode},
      onSelectionChanged: (selection) =>
          ref.read(mediaModeProvider.notifier).set(selection.first),
      showSelectedIcon: false,
      style: const ButtonStyle(
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
