import 'package:app/src/data/models/task_model.dart';
import 'package:app/src/domain/entities/task_entity.dart';

extension TaskEntityMapper on TaskEntity {
  TaskModel toModel() {
    return TaskModel(
      name: name,
      indicatorToMoId: indicatorToMoId,
      parentId: parentId,
      order: order,
    );
  }
}

extension TaskModelMapper on TaskModel {
  TaskEntity toEntity() {
    return TaskEntity(
      name: name,
      indicatorToMoId: indicatorToMoId,
      parentId: parentId,
      order: order,
    );
  }
}
