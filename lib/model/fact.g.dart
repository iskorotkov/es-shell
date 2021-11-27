// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      variable: Variable.fromJson(json['variable'] as Map<String, dynamic>),
      value: json['value'] as Object,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'variable': instance.variable,
      'value': instance.value,
    };
