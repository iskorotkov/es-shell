// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Domain _$DomainFromJson(Map<String, dynamic> json) => Domain(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      values:
          (json['values'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DomainToJson(Domain instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'description': instance.description,
      'name': instance.name,
      'values': instance.values,
    };
