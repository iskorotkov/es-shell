import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'domain.dart';
import 'rule.dart';
import 'variable.dart';

part 'project.g.dart';

@JsonSerializable()
class Project with ChangeNotifier {
  List<Domain> domains;
  List<Variable> variables;
  List<Rule> rules;
  Variable target;

  Project({
    required this.domains,
    required this.variables,
    required this.rules,
    required this.target,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
