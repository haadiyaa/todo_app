import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import '../model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _removedOrDeletedTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: task.isDeleted == false
            ? (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              }
            : null,
      ),
      onLongPress: () {
        _removedOrDeletedTask(context, task);
      },
    );
  }
}
