import 'package:app/src/domain/entities/task_entity.dart';
import 'package:appflowy_board/appflowy_board.dart';

class TaskBoardModel extends AppFlowyGroupItem {
  final TaskEntity task;

  TaskBoardModel(this.task);

  @override
  String get id => task.indicatorToMoId.toString();
}