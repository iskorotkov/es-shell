import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'variable.dart';

part 'fact.g.dart';

@JsonSerializable()
class Fact with ChangeNotifier {
  Variable variable;
  Object value;

  Fact({
    required this.variable,
    required this.value,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);
}
