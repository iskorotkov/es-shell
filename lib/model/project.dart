import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'domain.dart';
import 'rule.dart';
import 'variable.dart';

part 'project.g.dart';

@JsonSerializable()
class Project with ChangeNotifier {
  final String uuid;
  List<Domain> _domains;
  List<Variable> _variables;
  List<Rule> _rules;
  Variable _target;

  Project({
    required this.uuid,
    required List<Domain> domains,
    required List<Variable> variables,
    required List<Rule> rules,
    required Variable target,
  })  : _domains = domains,
        _variables = variables,
        _rules = rules,
        _target = target;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  List<Domain> get domains => _domains;

  set domains(List<Domain> domains) {
    _domains = domains;
    notifyListeners();
  }

  List<Rule> get rules => _rules;

  set rules(List<Rule> rules) {
    _rules = rules;
    notifyListeners();
  }

  Variable get target => _target;

  set target(Variable target) {
    _target = target;
    notifyListeners();
  }

  List<Variable> get variables => _variables;

  set variables(List<Variable> variables) {
    _variables = variables;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  @override
  String toString() => 'Project: $uuid';
}
