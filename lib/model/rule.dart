import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'fact.dart';

part 'rule.g.dart';

@JsonSerializable()
class Rule with ChangeNotifier {
  final String uuid;
  String _name;
  String _description;
  List<Fact> _conditions;
  List<Fact> _results;

  Rule({
    required this.uuid,
    required String name,
    required String description,
    required List<Fact> conditions,
    required List<Fact> results,
  })  : _name = name,
        _description = description,
        _conditions = conditions,
        _results = results;

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  List<Fact> get conditions => _conditions;

  set conditions(List<Fact> conditions) {
    _conditions = conditions;
    notifyListeners();
  }

  String get description => _description;

  set description(String description) {
    _description = description;
    notifyListeners();
  }

  String get name => _name;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  List<Fact> get results => _results;

  set results(List<Fact> results) {
    _results = results;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => _$RuleToJson(this);

  @override
  String toString() => 'Rule: $name';
}
