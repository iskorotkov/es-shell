import 'package:es_shell/engine/engine.dart';
import 'package:es_shell/model/domain.dart';
import 'package:es_shell/model/fact.dart';
import 'package:es_shell/model/project.dart';
import 'package:es_shell/model/rule.dart';
import 'package:es_shell/model/variable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('simple project infering', () {
    var project = _createSimpleProject();

    test('infer default target', () {
      var engine = Engine();
      engine.memory.values[project.variables.first] = 0;
      engine.infer(project);
    });

    test('infer custom target', () {
      var engine = Engine();
      engine.memory.values[project.variables.first] = 0;
      engine.infer(project, project.target);
    });
  });
}

Project _createSimpleProject() {
  var domains = <Domain>[];
  var variables = <Variable>[
    Variable(
      uuid: const Uuid().v4(),
      name: '1',
      description: '',
    ),
    Variable(
      uuid: const Uuid().v4(),
      name: '2',
      description: '',
    ),
    Variable(
      uuid: const Uuid().v4(),
      name: '3',
      description: '',
    ),
    Variable(
      uuid: const Uuid().v4(),
      name: '4',
      description: '',
    ),
  ];
  var rules = <Rule>[
    Rule(
      uuid: const Uuid().v4(),
      name: '1',
      description: '',
      conditions: [
        Fact(
          uuid: const Uuid().v4(),
          variable: variables[1],
          value: 1,
        ),
        Fact(
          uuid: const Uuid().v4(),
          variable: variables[2],
          value: 2,
        ),
      ],
      results: [
        Fact(
          uuid: const Uuid().v4(),
          variable: variables[3],
          value: 'success',
        ),
      ],
    ),
    Rule(
      uuid: const Uuid().v4(),
      name: '2',
      description: '',
      conditions: [
        Fact(
          uuid: const Uuid().v4(),
          variable: variables[0],
          value: 0,
        ),
      ],
      results: [
        Fact(
          uuid: const Uuid().v4(),
          variable: variables[1],
          value: 1,
        ),
      ],
    ),
  ];
  var target = variables.last;

  return Project(
    uuid: const Uuid().v4(),
    domains: domains,
    variables: variables,
    rules: rules,
    target: target,
  );
}
