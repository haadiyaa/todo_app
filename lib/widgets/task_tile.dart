import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import '../model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title,),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          context.read<TasksBloc>().add(UpdateTask(task: task));
        },
      ),
      onLongPress: () {
        context.read<TasksBloc>().add(DeleteTask(task: task));
      },
    );
  }
}