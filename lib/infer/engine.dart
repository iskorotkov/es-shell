import 'dart:developer';

import '../model/project.dart';
import '../model/variable.dart';
import '../model/variable_type.dart';
import 'memory.dart';
import 'stack.dart';

typedef PromptVariableCallback = Future<String> Function(Variable variable);

typedef ShowMessageCallback = Future<void> Function(String message);

class Engine {
  Memory memory = Memory();
  StackFrameVariable? stack;

  Future<String?> infer(Project project, PromptVariableCallback prompt,
      [ShowMessageCallback? showMessage]) async {
    stack = StackFrameVariable(variable: project.target, fromCache: false);
    await _infer(project, prompt, showMessage, project.target, stack!);
    return memory.variables[project.target];
  }

  _infer(
      Project project,
      PromptVariableCallback prompt,
      ShowMessageCallback? showMessage,
      Variable target,
      StackFrameVariable stack) async {
    var rules = project.rules
        .where((rule) => rule.results.any((res) => res.variable == target));

    log('inferring variable $target');

    ruleLoop:
    for (var rule in rules) {
      var ruleFrame = StackFrameRule(rule: rule, matched: false);
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
        } else {
          switch (condition.variable.variableType) {
            case VariableType.inferred:
              log('inferring variable from rules');
              await _infer(project, prompt, showMessage, condition.variable,
                  variableFrame);
              break;
            case VariableType.prompted:
              log('asking user for value');
              memory.variables[condition.variable] =
                  await prompt(condition.variable);
              break;
            case VariableType.inferredThenPrompted:
              log('infer, then ask user');
              // infer.
              await _infer(project, prompt, showMessage, condition.variable,
                  variableFrame);
              var inferredValue = memory.variables[condition.variable];
              // prompt.
              var promptedValue = await prompt(condition.variable);
              // compare values.
              if (inferredValue != null && inferredValue != promptedValue) {
                log('inferred "$inferredValue" and prompted "$promptedValue" values for don\'t match');
                showMessage?.call(
                    'Inferred "$inferredValue" and prompted "$promptedValue" values for don\'t match');
              }
              // set value.
              memory.variables[condition.variable] = promptedValue;
              break;
            case VariableType.promptedThenInferred:
              log('ask user, then infer');
              // prompt.
              var promptedValue = await prompt(condition.variable);
              // infer.
              await _infer(project, prompt, showMessage, condition.variable,
                  variableFrame);
              var inferredValue = memory.variables[condition.variable];
              // compare values.
              if (inferredValue != null && inferredValue != promptedValue) {
                log('inferred "$inferredValue" and prompted "$promptedValue" values don\'t match');
                showMessage?.call(
                    'Inferred "$inferredValue" and prompted "$promptedValue" values don\'t match');
              }
              // set value.
              memory.variables[condition.variable] =
                  inferredValue ?? promptedValue;
              break;
            default:
              throw Exception(
                  'unknown variable type ${condition.variable.variableType}');
          }
        }

        if (condition.value != memory.variables[condition.variable]) {
          log('rule rejected');
          ruleFrame.matched = false;
          continue ruleLoop;
        }
      }

      log('rule matched');
      ruleFrame.matched = true;

      for (var result in rule.results) {
        log('setting value of variable ${result.variable}');
        memory.variables[result.variable] = result.value;
      }

      return;
    }
  }
}
