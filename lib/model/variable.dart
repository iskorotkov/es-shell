import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'domain.dart';
import 'variable_type.dart';

part 'variable.g.dart';

@JsonSerializable()
class Variable extends Equatable with ChangeNotifier {
  final String uuid;
  String name;
  String description;
  VariableType variableType;
  Domain? domain;

  Variable({
    required this.uuid,
    required this.name,
    required this.description,
    this.variableType = VariableType.inferred,
    this.domain,
  });

  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);

  @override
  List<Object?> get props => [uuid];

  Map<String, dynamic> toJson() => _$VariableToJson(this);

  @override
  String toString() => 'Variable: $name';
}
