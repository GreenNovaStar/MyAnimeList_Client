import 'package:android_app/utils/formatters/media_type_label.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('mediaTypeLabel', () {
    test('returns null for null input', () {
      expect(mediaTypeLabel(null), isNull);
    });

    test('returns null for empty string', () {
      expect(mediaTypeLabel(''), isNull);
    });

    test('maps tv to TV', () {
      expect(mediaTypeLabel('tv'), 'TV');
    });

    test('maps ova to OVA', () {
      expect(mediaTypeLabel('ova'), 'OVA');
    });

    test('maps ona to ONA', () {
      expect(mediaTypeLabel('ona'), 'ONA');
    });

    test('capitalizes first letter for other types', () {
      expect(mediaTypeLabel('movie'), 'Movie');
      expect(mediaTypeLabel('special'), 'Special');
      expect(mediaTypeLabel('music'), 'Music');
    });

    test('handles single character input', () {
      expect(mediaTypeLabel('x'), 'X');
    });
  });
}
