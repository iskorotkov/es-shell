// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Domain _$DomainFromJson(Map<String, dynamic> json) => Domain(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      dataType: $enumDecode(_$DataTypeEnumMap, json['dataType']),
      values:
          (json['values'] as List<dynamic>).map((e) => e as Object).toList(),
    );

Map<String, dynamic> _$DomainToJson(Domain instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'description': instance.description,
      'dataType': _$DataTypeEnumMap[instance.dataType],
      'values': instance.values,
    };

const _$DataTypeEnumMap = {
  DataType.string: 'string',
  DataType.int: 'int',
};
