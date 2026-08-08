import 'package:android_app/data/model/alternative_titles.dart';
import 'package:android_app/data/model/node.dart';
import 'package:android_app/utils/extension_methods/node_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('displayTitle', () {
    const node = Node(
      title: 'Shingeki no Kyojin',
      alternativeTitles: AlternativeTitles(en: 'Attack on Titan'),
    );

    test('returns the default (romaji) title when English is off', () {
      expect(node.displayTitle(preferEnglish: false), 'Shingeki no Kyojin');
    });

    test('returns the English title when preferred and present', () {
      expect(node.displayTitle(preferEnglish: true), 'Attack on Titan');
    });

    test('falls back to romaji when the English title is missing', () {
      const noEn = Node(title: 'Romaji Only');
      expect(noEn.displayTitle(preferEnglish: true), 'Romaji Only');
    });

    test('falls back to romaji when the English title is empty', () {
      const emptyEn = Node(
        title: 'Romaji',
        alternativeTitles: AlternativeTitles(en: ''),
      );
      expect(emptyEn.displayTitle(preferEnglish: true), 'Romaji');
    });

    test('returns empty string when no title at all', () {
      expect(const Node().displayTitle(preferEnglish: true), '');
    });
  });
}
