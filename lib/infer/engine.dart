import 'dart:developer';

import '../model/project.dart';
import '../model/variable.dart';
import '../model/variable_type.dart';
import 'memory.dart';
import 'stack.dart';

typedef PromptVariableCallback = Future<String> Function(Variable variable);

class Engine {
  Memory memory = Memory();
  StackFrameVariable? stack;

  Future<String?> infer(Project project, PromptVariableCallback prompt) async {
    stack = StackFrameVariable(variable: project.target, fromCache: false);
    await _infer(project, prompt, project.target, stack!);
    return memory.variables[project.target];
  }

  _infer(Project project, PromptVariableCallback prompt, Variable target,
      StackFrameVariable stack) async {
    var rules = project.rules
        .where((rule) => rule.results.any((res) => res.variable == target));

    log('inferring variable $target');

    ruleLoop:
    for (var rule in rules) {
      if (memory.rules.containsKey(rule)) {
        continue;
      }

      var ruleFrame = StackFrameRule(rule: rule);
      stack.children.add(ruleFrame);

      log('took rule $rule');

      for (var condition in rule.conditions) {
        var variableFrame =
            StackFrameVariable(variable: condition.variable, fromCache: false);
        ruleFrame.children.add(variableFrame);

        log('took condition $condition');
        log('variable type is ${condition.variable.variableType}');

        if (memory.variables.containsKey(condition.variable)) {
          log('getting value from cache');
          variableFrame.fromCache = true;
        } else if (condition.variable.variableType == VariableType.inferred) {
          log('inferring variable from rules');
          await _infer(project, prompt, condition.variable, variableFrame);
        } else if (condition.variable.variableType == VariableType.prompted) {
          log('asking user for value');
          var value = await prompt(condition.variable);
          memory.variables[condition.variable] = value;
        }

        if (condition.value != memory.variables[condition.variable]) {
          log('rule rejected');
          memory.rules[rule] = false;
          continue ruleLoop;
        }
      }

      log('rule matched');
      memory.rules[rule] = true;

      for (var result in rule.results) {
        log('setting value of variable ${result.variable}');
        memory.variables[result.variable] = result.value;
      }
    }
  }
}
