import 'package:es_shell/engine/engine.dart';
import 'package:es_shell/model/domain.dart';
import 'package:es_shell/model/fact.dart';
import 'package:es_shell/model/project.dart';
import 'package:es_shell/model/rule.dart';
import 'package:es_shell/model/variable.dart';
import 'package:flutter_test/flutter_test.dart';

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
    Variable(name: '1', description: ''),
    Variable(name: '2', description: ''),
    Variable(name: '3', description: ''),
    Variable(name: '4', description: ''),
  ];
  var rules = <Rule>[
    Rule(
      name: '1',
      description: '',
      conditions: [
        Fact(variable: variables[1], value: 1),
        Fact(variable: variables[2], value: 2),
      ],
      results: [
        Fact(variable: variables[3], value: 'success'),
      ],
    ),
    Rule(
      name: '2',
      description: '',
      conditions: [
        Fact(variable: variables[0], value: 0),
      ],
      results: [
        Fact(variable: variables[1], value: 1),
      ],
    ),
  ];
  var target = variables.last;

  return Project(
    domains: domains,
    variables: variables,
    rules: rules,
    target: target,
  );
}
