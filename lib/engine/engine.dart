import '../model/project.dart';
import '../model/variable.dart';

class Engine {
  Memory memory = Memory();

  Object infer(Project project, [Variable? overrideTarget]) {
    overrideTarget ??= project.target;

    var rules = project.rules.where(
        (rule) => rule.results.any((res) => res.variable == overrideTarget));

    ruleLoop:
    for (var rule in rules) {
      for (var condition in rule.conditions) {
        if (!memory.values.containsKey(condition.variable)) {
          var res = infer(project, condition.variable);
          memory.values[condition.variable] = res;
        }

        if (condition.value != memory.values[condition.variable]) {
          continue ruleLoop;
        }

        for (var result in rule.results) {
          memory.values[result.variable] = result.value;
        }
      }
    }

    return 'undefined';
  }
}

class Memory {
  Map<Variable, Object> values = <Variable, Object>{};
}
