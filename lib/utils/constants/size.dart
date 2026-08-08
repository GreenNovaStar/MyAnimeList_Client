/// App-wide sizing tokens: spacing, corner radii, and tile dimensions.
class NovaSize {
  // Spacing scale.
  static const double spaceXs = 4;
  static const double spaceSm = 8;
  static const double spaceMd = 12;
  static const double spaceLg = 16;

  // Corner radii.
  static const double radiusTile = 16;
  static const double radiusBadge = 8;
  static const double radiusPill = 999;

  // Rail tile dimensions.
  static const double railTileWidth = 150;
  static const double railTileHeight = 250;
  static const double railPosterHeight = 180;
  static const double railHeight = 250;

  /// Default edge length for a square (grid) tile.
  static const double squareTileExtent = 170;

  /// Below this tile width, status is shown as a compact corner marker;
  /// at/above it, a labeled pill is used.
  static const double pillWidthThreshold = 170;
}
