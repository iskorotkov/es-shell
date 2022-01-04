import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'variable.dart';

part 'fact.g.dart';

@JsonSerializable()
class Fact with ChangeNotifier {
  final String uuid;
  Variable variable;
  String value;

  Fact({
    required this.uuid,
    required this.variable,
    required this.value,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);

  @override
  String toString() => 'Fact: $variable == $value';
}
