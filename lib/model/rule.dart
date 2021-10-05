import 'fact.dart';

class Rule {
  String description;
  final List<Fact> conditions = [];
  final List<Fact> results = [];

  Rule(this.description);
}
