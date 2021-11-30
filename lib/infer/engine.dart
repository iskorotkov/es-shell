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
    return memory.values[project.target];
  }

  _infer(Project project, PromptVariableCallback prompt, Variable target,
      StackFrameVariable stack) async {
    var rules = project.rules
        .where((rule) => rule.results.any((res) => res.variable == target));

    log('inferring variable $target');

    ruleLoop:
    for (var rule in rules) {
      var ruleFrame = StackFrameRule(rule: rule);
      stack.children.add(ruleFrame);

      log('took rule $rule');

      for (var condition in rule.conditions) {
        var variableFrame = StackFrameVariable(variable: condition.variable);
        ruleFrame.children.add(variableFrame);

        log('took condition $condition');
        log('variable type is ${condition.variable.variableType}');

        if (memory.values.containsKey(condition.variable)) {
          log('getting value from cache');
          variableFrame.fromCache = true;
        } else if (condition.variable.variableType == VariableType.inferred) {
          log('inferring variable from rules');
          await _infer(project, prompt, condition.variable, variableFrame);
        } else {
          log('asking user for value');
          var value = await prompt(condition.variable);
          memory.values[condition.variable] = value;
        }

        if (condition.value != memory.values[condition.variable]) {
          log('rule rejected');
          continue ruleLoop;
        }
      }

      log('rule matched');
      ruleFrame.matched = true;

      for (var result in rule.results) {
        log('setting value of variable ${result.variable}');
        memory.values[result.variable] = result.value;
      }
    }
  }
}