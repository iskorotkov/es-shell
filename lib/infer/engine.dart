import '../model/project.dart';
import '../model/variable.dart';
import 'memory.dart';
import 'stack.dart';

class Engine {
  Memory memory = Memory();
  StackFrameVariable? stack;

  Object? infer(Project project) {
    stack = StackFrameVariable(variable: project.target, fromCache: false);
    _infer(project, project.target, stack!);
    return memory.values[project.target];
  }

  _infer(Project project, Variable target, StackFrameVariable stack) {
    var rules = project.rules
        .where((rule) => rule.results.any((res) => res.variable == target));

    ruleLoop:
    for (var rule in rules) {
      var ruleStack = StackFrameRule(rule: rule);
      stack.children.add(ruleStack);

      for (var condition in rule.conditions) {
        var variableStack = StackFrameVariable(variable: condition.variable);
        ruleStack.children.add(variableStack);

        if (memory.values.containsKey(condition.variable)) {
          // Got variable from cache.
          variableStack.fromCache = true;
        } else {
          // Try to infer variable value.
          _infer(project, condition.variable, variableStack);
        }

        // Variable value doesn't match.
        if (condition.value != memory.values[condition.variable]) {
          continue ruleLoop;
        }
      }

      ruleStack.matched = true;

      for (var result in rule.results) {
        memory.values[result.variable] = result.value;
      }
    }
  }
}
