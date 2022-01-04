// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rule _$RuleFromJson(Map<String, dynamic> json) => Rule(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      conditions: (json['conditions'] as List<dynamic>)
          .map((e) => Fact.fromJson(e as Map<String, dynamic>))
          .toList(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Fact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RuleToJson(Rule instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'conditions': instance.conditions,
      'description': instance.description,
      'name': instance.name,
      'results': instance.results,
    };
