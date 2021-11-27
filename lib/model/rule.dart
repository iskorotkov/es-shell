import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'fact.dart';

part 'rule.g.dart';

@JsonSerializable()
class Rule extends Equatable with ChangeNotifier {
  final String uuid;
  String name;
  String description;
  List<Fact> conditions;
  List<Fact> results;

  Rule({
    required this.uuid,
    required this.name,
    required this.description,
    required this.conditions,
    required this.results,
  });

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  @override
  List<Object?> get props => [uuid];

  Map<String, dynamic> toJson() => _$RuleToJson(this);
}
