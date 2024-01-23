import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import 'package:todo_app/model/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (BuildContext context, int index) {
          var task = tasksList[index];
          return ListTile(
            title: Text(task.title),
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
        },
      ),
    );
  }
}