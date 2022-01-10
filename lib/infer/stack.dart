import '../model/rule.dart';
import '../model/variable.dart';

class StackFrameVariable {
  final Variable variable;
  bool fromCache;
  final children = <StackFrameRule>[];

  StackFrameVariable({required this.variable, required this.fromCache});
}

class StackFrameRule {
  final Rule rule;
  bool matched;
  final children = <StackFrameVariable>[];

  StackFrameRule({required this.rule, required this.matched});
}
