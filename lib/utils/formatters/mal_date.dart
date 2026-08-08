/// The MAL API exchanges dates as `yyyy-MM-dd` strings (e.g. list-status
/// start/finish dates). These helpers convert to and from that wire format.
library;

String formatMalDate(DateTime date) =>
    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

DateTime? parseMalDate(String? dateStr) {
  if (dateStr == null || dateStr.isEmpty) return null;
  return DateTime.tryParse(dateStr);
}
