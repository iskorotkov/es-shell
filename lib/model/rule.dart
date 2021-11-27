import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'fact.dart';

part 'rule.g.dart';

@JsonSerializable()
class Rule with ChangeNotifier {
  String name;
  String description;
  List<Fact> conditions;
  List<Fact> results;

  Rule({
    required this.name,
    required this.description,
    required this.conditions,
    required this.results,
  });

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);
}
