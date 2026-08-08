import 'package:android_app/utils/extension_methods/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('capitalizeFirstLetter', () {
    test('capitalizes first letter and lowercases rest', () {
      expect('hello'.capitalizeFirstLetter(), 'Hello');
      expect('HELLO'.capitalizeFirstLetter(), 'Hello');
      expect('hELLO'.capitalizeFirstLetter(), 'Hello');
    });

    test('single character', () {
      expect('a'.capitalizeFirstLetter(), 'A');
      expect('A'.capitalizeFirstLetter(), 'A');
    });
  });

  group('prettifyString', () {
    test('single word gets capitalized', () {
      expect('watching'.prettifyString(), 'Watching');
    });

    test('underscored words get split and capitalized', () {
      expect('plan_to_watch'.prettifyString(), 'Plan To Watch');
      expect('on_hold'.prettifyString(), 'On Hold');
    });

    test('space-separated words get capitalized', () {
      expect('light novel'.prettifyString(), 'Light Novel');
    });

    test('handles already capitalized input', () {
      expect('Completed'.prettifyString(), 'Completed');
    });
  });
}
