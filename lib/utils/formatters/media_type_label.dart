/// Converts a raw MAL media_type string (e.g. "tv") into a display label (e.g. "TV").
/// Returns null for null or empty input.
String? mediaTypeLabel(String? raw) {
  if (raw == null || raw.isEmpty) return null;
  const overrides = {'tv': 'TV', 'ova': 'OVA', 'ona': 'ONA'};
  return overrides[raw] ?? (raw[0].toUpperCase() + raw.substring(1));
}
