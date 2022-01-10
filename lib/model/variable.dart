import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'domain.dart';
import 'variable_type.dart';

part 'variable.g.dart';

@JsonSerializable()
class Variable with ChangeNotifier {
  final String uuid;
  String _name;
  String _description;
  String? _question;
  VariableType _variableType;
  Domain? _domain;

  Variable({
    required this.uuid,
    required String name,
    required String description,
    String? question,
    VariableType variableType = VariableType.inferred,
    Domain? domain,
  })  : _name = name,
        _description = description,
        _question = question,
        _variableType = variableType,
        _domain = domain;

  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);

  String get description => _description;

  set description(String description) {
    _description = description;
    notifyListeners();
  }

  String questionOrDefault() => question ?? '$name?';

  Domain? get domain => _domain;

  set domain(Domain? domain) {
    _domain = domain;
    notifyListeners();
  }

  String get name => _name;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  String? get question => _question;

  set question(String? question) {
    _question = question;
    notifyListeners();
  }

  VariableType get variableType => _variableType;

  set variableType(VariableType vt) {
    _variableType = vt;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => _$VariableToJson(this);

  @override
  String toString() => 'Variable: $name';
}
