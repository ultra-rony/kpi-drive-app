import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entity.freezed.dart';

@freezed
abstract class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'indicator_to_mo_id') int? indicatorToMoId,
    @JsonKey(name: 'parent_id') int? parentId,
    @JsonKey(name: 'order') int? order,
  }) = _TaskEntity;
}
