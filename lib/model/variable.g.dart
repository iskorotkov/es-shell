// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variable _$VariableFromJson(Map<String, dynamic> json) => Variable(
      name: json['name'] as String,
      description: json['description'] as String,
      dataType: $enumDecodeNullable(_$DataTypeEnumMap, json['dataType']) ??
          DataType.int,
      variableType:
          $enumDecodeNullable(_$VariableTypeEnumMap, json['variableType']) ??
              VariableType.inferred,
      domain: json['domain'] == null
          ? null
          : Domain.fromJson(json['domain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VariableToJson(Variable instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'dataType': _$DataTypeEnumMap[instance.dataType],
      'variableType': _$VariableTypeEnumMap[instance.variableType],
      'domain': instance.domain,
    };

const _$DataTypeEnumMap = {
  DataType.string: 'string',
  DataType.int: 'int',
};

const _$VariableTypeEnumMap = {
  VariableType.inferred: 'inferred',
  VariableType.prompted: 'prompted',
  VariableType.inferredThenPrompted: 'inferredThenPrompted',
  VariableType.promptedThenInferred: 'promptedThenInferred',
};
