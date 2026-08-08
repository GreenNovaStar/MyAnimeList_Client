import 'package:android_app/utils/formatters/episode_label.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('episodeCountLabel', () {
    test('formats a positive count', () {
      expect(episodeCountLabel(1), '1 ep');
      expect(episodeCountLabel(25), '25 ep');
    });

    test('returns null for null input', () {
      expect(episodeCountLabel(null), isNull);
    });

    test('returns null for zero (MAL sends 0 for airing shows)', () {
      expect(episodeCountLabel(0), isNull);
    });
  });

  group('episodeDurationLabel', () {
    test('converts seconds to rounded minutes', () {
      expect(episodeDurationLabel(1440), '24 min/ep');
      expect(episodeDurationLabel(1470), '25 min/ep'); // 24.5 rounds up
    });

    test('returns null for null or zero', () {
      expect(episodeDurationLabel(null), isNull);
      expect(episodeDurationLabel(0), isNull);
    });
  });
}
