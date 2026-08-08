import 'package:android_app/utils/formatters/mal_date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('formatMalDate', () {
    test('formats as yyyy-MM-dd', () {
      expect(formatMalDate(DateTime(2025, 1, 15)), '2025-01-15');
    });

    test('pads single-digit month and day', () {
      expect(formatMalDate(DateTime(2025, 3, 5)), '2025-03-05');
    });

    test('ignores the time component', () {
      expect(formatMalDate(DateTime(2025, 12, 31, 23, 59)), '2025-12-31');
    });
  });

  group('parseMalDate', () {
    test('parses a yyyy-MM-dd string', () {
      expect(parseMalDate('2025-01-15'), DateTime(2025, 1, 15));
    });

    test('returns null for null or empty', () {
      expect(parseMalDate(null), isNull);
      expect(parseMalDate(''), isNull);
    });

    test('returns null for garbage input', () {
      expect(parseMalDate('not-a-date'), isNull);
    });

    test('round-trips with formatMalDate', () {
      final date = DateTime(2024, 7, 4);
      expect(parseMalDate(formatMalDate(date)), date);
    });
  });
}
