import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'variable.dart';

part 'fact.g.dart';

@JsonSerializable()
class Fact extends Equatable with ChangeNotifier {
  final String uuid;
  Variable variable;
  Object value;

  Fact({
    required this.uuid,
    required this.variable,
    required this.value,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  @override
  List<Object?> get props => [uuid];

  Map<String, dynamic> toJson() => _$FactToJson(this);
}
