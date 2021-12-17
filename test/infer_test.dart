import 'package:es_shell/infer/engine.dart';
import 'package:es_shell/sample_project.dart';
import 'package:flutter_test/flutter_test.dart'
    show expect, group, test, equals, hasLength;

void main() {
  group('simple project infering', () {
    var project = createSampleProject();

    test('infer default target', () async {
      var engine = Engine();
      var res = await engine.infer(project, (variable) async {
        if (variable == project.variables[0]) {
          return '0';
        }

        if (variable == project.variables[2]) {
          return '2';
        }

        throw Exception('variable ${variable.name} is not promptable');
      });

      expect(res, equals('success'));
      expect(engine.memory.variables, hasLength(equals(4)));
    });
  });
}
