import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data_type.dart';
import 'domain.dart';
import 'variable_type.dart';

part 'variable.g.dart';

@JsonSerializable()
class Variable with ChangeNotifier {
  String name;
  String description;
  DataType dataType;
  VariableType variableType;
  Domain? domain;

  Variable({
    required this.name,
    required this.description,
    this.dataType = DataType.int,
    this.variableType = VariableType.inferred,
    this.domain,
  });

  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);

  Map<String, dynamic> toJson() => _$VariableToJson(this);
}
