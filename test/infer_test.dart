import 'package:es_shell/infer/engine.dart';
import 'package:es_shell/sample_project.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('simple project infering', () {
    var project = createSampleProject();

    test('infer default target', () {
      var engine = Engine();
      engine.memory.values[project.variables[0]] = 0;
      engine.memory.values[project.variables[2]] = 2;
      var res = engine.infer(project);
      expect(res, equals('success'));
    });
  });
}
