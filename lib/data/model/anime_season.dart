enum AnimeSeason {
  winter('winter'),
  spring('spring'),
  summer('summer'),
  fall('fall');

  final String value;
  const AnimeSeason(this.value);

  static AnimeSeason of(String value) =>
      values.firstWhere((e) => e.value == value);

  AnimeSeason get next => values[(index + 1) % values.length];
}
