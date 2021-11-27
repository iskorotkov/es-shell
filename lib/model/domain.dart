import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data_type.dart';

part 'domain.g.dart';

@JsonSerializable()
class Domain with ChangeNotifier {
  String name;
  String description;
  DataType dataType;
  List<Object> values;

  Domain({
    required this.name,
    required this.description,
    required this.dataType,
    required this.values,
  });

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

  Map<String, dynamic> toJson() => _$DomainToJson(this);
}
