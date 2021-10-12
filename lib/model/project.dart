import 'domain.dart';
import 'rule.dart';
import 'variable.dart';

class Project {
  List<Domain> domains = [];
  List<Variable> variables = [];
  List<Rule> rules = [];
  Variable target;

  Project({
    required this.domains,
    required this.variables,
    required this.rules,
    required this.target,
  }) {
    if (!variables.contains(target)) {
      throw Exception('target variable isn\'t in variables list');
    }

    for (var variable in variables) {
      if (variable.domain == null) {
        continue;
      }

      if (!domains.contains(variable.domain)) {
        throw Exception('variable domain isn\'t in domains list');
      }
    }
  }
}
