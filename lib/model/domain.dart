import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'domain.g.dart';

@JsonSerializable()
class Domain with ChangeNotifier {
  final String uuid;
  String _name;
  String _description;
  List<String> _values;

  Domain({
    required this.uuid,
    required String name,
    required String description,
    required List<String> values,
  })  : _name = name,
        _description = description,
        _values = values;

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

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

  List<String> get values => _values;

  set values(List<String> values) {
    _values = values;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => _$DomainToJson(this);

  @override
  String toString() => 'Domain: $name';
}
