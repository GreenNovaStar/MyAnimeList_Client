/// Display label for an episode count (e.g. "12 ep"). Returns null when the
/// count is missing or zero — MAL sends `num_episodes: 0` for shows that are
/// still airing, which should not render as "0 ep".
String? episodeCountLabel(int? numEpisodes) {
  if (numEpisodes == null || numEpisodes <= 0) return null;
  return '$numEpisodes ep';
}

/// Display label for MAL's `average_episode_duration` (seconds on the wire),
/// e.g. "24 min/ep". Returns null when missing or zero.
String? episodeDurationLabel(int? averageEpisodeDurationSeconds) {
  if (averageEpisodeDurationSeconds == null ||
      averageEpisodeDurationSeconds <= 0) {
    return null;
  }
  return '${(averageEpisodeDurationSeconds / 60).round()} min/ep';
}
