import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "indicator_to_mo_id")
  final int? indicatorToMoId;
  @JsonKey(name: "parent_id")
  final int? parentId;
  @JsonKey(name: "order")
  final int? order;

  TaskModel({this.name, this.indicatorToMoId, this.parentId, this.order});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return _$TaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TaskModelToJson(this);
  }
}
