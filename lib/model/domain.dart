import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data_type.dart';

part 'domain.g.dart';

@JsonSerializable()
class Domain extends Equatable with ChangeNotifier {
  final String uuid;
  String name;
  String description;
  DataType dataType;
  List<String> values;

  Domain({
    required this.uuid,
    required this.name,
    required this.description,
    required this.dataType,
    required this.values,
  });

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

  @override
  List<Object?> get props => [uuid];

  Map<String, dynamic> toJson() => _$DomainToJson(this);

  @override
  String toString() => 'Domain: $name';
}
