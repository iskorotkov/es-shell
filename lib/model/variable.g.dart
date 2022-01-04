// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variable _$VariableFromJson(Map<String, dynamic> json) => Variable(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      variableType:
          $enumDecodeNullable(_$VariableTypeEnumMap, json['variableType']) ??
              VariableType.inferred,
      domain: json['domain'] == null
          ? null
          : Domain.fromJson(json['domain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VariableToJson(Variable instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'description': instance.description,
      'domain': instance.domain,
      'name': instance.name,
      'variableType': _$VariableTypeEnumMap[instance.variableType],
    };

const _$VariableTypeEnumMap = {
  VariableType.inferred: 'inferred',
  VariableType.prompted: 'prompted',
  VariableType.inferredThenPrompted: 'inferredThenPrompted',
  VariableType.promptedThenInferred: 'promptedThenInferred',
};
