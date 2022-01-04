import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'variable.dart';

part 'fact.g.dart';

@JsonSerializable()
class Fact with ChangeNotifier {
  final String uuid;
  Variable _variable;
  String _value;

  Fact({
    required this.uuid,
    required Variable variable,
    required String value,
  })  : _variable = variable,
        _value = value;

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  String get value => _value;

  set value(String value) {
    _value = value;
    notifyListeners();
  }

  Variable get variable => _variable;

  set variable(Variable variable) {
    _variable = variable;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => _$FactToJson(this);

  @override
  String toString() => 'Fact: $variable == $value';
}
