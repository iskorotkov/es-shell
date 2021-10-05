import 'fact.dart';
import 'rule.dart';
import 'variable.dart';

class Project {
  final List<Rule> rules = [];
  final List<Variable> variables = [];
  final List<Fact> facts = [];
  Variable target;

  Project(this.target);
}
