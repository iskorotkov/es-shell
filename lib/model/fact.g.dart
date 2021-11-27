// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      uuid: json['uuid'] as String,
      variable: Variable.fromJson(json['variable'] as Map<String, dynamic>),
      value: json['value'] as Object,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'variable': instance.variable,
      'value': instance.value,
    };
