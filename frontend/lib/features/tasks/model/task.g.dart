// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  priority: json['priority'] as String,
  status: json['status'] as String,
  assigned_to: json['assigned_to'] as String?,
  due_date: json['due_date'] == null
      ? null
      : DateTime.parse(json['due_date'] as String),
  extracted_entities: (json['extracted_entities'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  suggested_actions: (json['suggested_actions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  created_at: DateTime.parse(json['created_at'] as String),
  updated_at: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'priority': instance.priority,
      'status': instance.status,
      'assigned_to': instance.assigned_to,
      'due_date': instance.due_date?.toIso8601String(),
      'extracted_entities': instance.extracted_entities,
      'suggested_actions': instance.suggested_actions,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
    };
