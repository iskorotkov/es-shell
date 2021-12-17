import '../model/rule.dart';
import '../model/variable.dart';

class Memory {
  Map<Variable, String> variables = <Variable, String>{};
  Map<Rule, bool> rules = <Rule, bool>{};
}
