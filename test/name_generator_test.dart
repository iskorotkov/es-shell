import 'package:es_shell/utils/name_generator.dart';
import 'package:flutter_test/flutter_test.dart'
    show expect, group, test, equals, hasLength;

void main() {
  group('simple project infering', () {
    var g = NameGenerator();

    test('use prefix + N as name', () async {
      expect(g.generate('Variable', []), equals('Variable 1'));
    });

    test('use prefix + N + v as name', () {
      expect(g.generate('Variable', ['Variable 1', 'Variable 3']),
          equals('Variable 4'));
    });
  });
}
