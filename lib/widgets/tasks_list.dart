import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_tile.dart';
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
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 5,),
        itemCount: tasksList.length,
        itemBuilder: (BuildContext context, int index) {
          var task = tasksList[index];
          return TaskTile(task: task);
        },
      ),
    );
  }
}