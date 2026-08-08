import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/utils/constants/color.dart';
import 'package:flutter/material.dart';

enum AnimeListStatus {
  watching('watching', 'Watching'),
  completed('completed', 'Completed'),
  onHold('on_hold', 'On Hold'),
  dropped('dropped', 'Dropped'),
  planToWatch('plan_to_watch', 'Plan to Watch');

  final String value;
  final String label;
  const AnimeListStatus(this.value, this.label);

  Color get color => switch (this) {
    watching => NovaColors.watching,
    completed => NovaColors.completed,
    onHold => NovaColors.onHold,
    dropped => NovaColors.dropped,
    planToWatch => NovaColors.planToWatch,
  };

  static AnimeListStatus of(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum MangaListStatus {
  reading('reading', 'Reading'),
  completed('completed', 'Completed'),
  onHold('on_hold', 'On Hold'),
  dropped('dropped', 'Dropped'),
  planToRead('plan_to_read', 'Plan to Read');

  final String value;
  final String label;
  const MangaListStatus(this.value, this.label);

  Color get color => switch (this) {
    reading => NovaColors.reading,
    completed => NovaColors.completed,
    onHold => NovaColors.onHold,
    dropped => NovaColors.dropped,
    planToRead => NovaColors.planToRead,
  };

  static MangaListStatus of(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum ListSort {
  listScore('list_score', 'Score'),
  listUpdatedAt('list_updated_at', 'Last Updated'),
  animeTitle('anime_title', 'Title'),
  animeStartDate('anime_start_date', 'Start Date'),
  mangaTitle('manga_title', 'Title'),
  mangaStartDate('manga_start_date', 'Start Date');

  final String value;
  final String label;
  const ListSort(this.value, this.label);

  static ListSort of(String value) =>
      values.firstWhere((e) => e.value == value);

  /// The sort choices offered for one media type (title/start-date sorts are
  /// per-type wire values).
  static List<ListSort> forKind(MediaKind kind) => switch (kind) {
    MediaKind.anime => [listUpdatedAt, listScore, animeTitle, animeStartDate],
    MediaKind.manga => [listUpdatedAt, listScore, mangaTitle, mangaStartDate],
  };
}
