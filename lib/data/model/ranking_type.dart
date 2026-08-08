enum AnimeRankingType {
  all('all'),
  airing('airing'),
  upcoming('upcoming'),
  tv('tv'),
  ova('ova'),
  movie('movie'),
  special('special'),
  bypopularity('bypopularity'),
  favorite('favorite'),
  trend('trend');

  final String value;
  const AnimeRankingType(this.value);

  static AnimeRankingType of(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum MangaRankingType {
  all('all'),
  manga('manga'),
  novels('novels'),
  oneshots('oneshots'),
  doujin('doujin'),
  manhwa('manhwa'),
  manhua('manhua'),
  bypopularity('bypopularity'),
  favorite('favorite');

  final String value;
  const MangaRankingType(this.value);

  static MangaRankingType of(String value) =>
      values.firstWhere((e) => e.value == value);
}
