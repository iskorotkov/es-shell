// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rule _$RuleFromJson(Map<String, dynamic> json) => Rule(
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
      'name': instance.name,
      'description': instance.description,
      'conditions': instance.conditions,
      'results': instance.results,
    };
