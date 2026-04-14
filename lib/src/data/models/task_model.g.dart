// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
  name: json['name'] as String?,
  indicatorToMoId: (json['indicator_to_mo_id'] as num?)?.toInt(),
  parentId: (json['parent_id'] as num?)?.toInt(),
  order: (json['order'] as num?)?.toInt(),
);

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
  'name': instance.name,
  'indicator_to_mo_id': instance.indicatorToMoId,
  'parent_id': instance.parentId,
  'order': instance.order,
};
