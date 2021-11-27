// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      domains: (json['domains'] as List<dynamic>)
          .map((e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
      variables: (json['variables'] as List<dynamic>)
          .map((e) => Variable.fromJson(e as Map<String, dynamic>))
          .toList(),
      rules: (json['rules'] as List<dynamic>)
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
      target: Variable.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'domains': instance.domains,
      'variables': instance.variables,
      'rules': instance.rules,
      'target': instance.target,
    };
