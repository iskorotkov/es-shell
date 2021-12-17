import 'package:uuid/uuid.dart';

import 'model/domain.dart';
import 'model/fact.dart';
import 'model/project.dart';
import 'model/rule.dart';
import 'model/variable.dart';
import 'model/variable_type.dart';

Project createSampleProject() {
  var domains = <Domain>[
    Domain(
        uuid: const Uuid().v4(),
        name: '1',
        description: '',
        values: const ['x', 'y', '2']),
  ];
  var variables = <Variable>[
    Variable(
      uuid: const Uuid().v4(),
      name: '1',
      description: '',
      variableType: VariableType.prompted,
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
      variableType: VariableType.prompted,
      domain: domains[0],
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
          value: '1',
        ),
        Fact(
          uuid: const Uuid().v4(),
          variable: variables[2],
          value: '2',
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
          value: '0',
        ),
      ],
      results: [
        Fact(
          uuid: const Uuid().v4(),
          variable: variables[1],
          value: '1',
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
