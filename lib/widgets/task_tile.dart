import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/screens/edit_task_screen.dart';
import 'package:todo_app/widgets/popup_menu.dart';
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

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: EditTaskScreen(
                  oldTask: task,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: task.isDeleted == false
                      ? const TextStyle(fontSize: 18)
                      : const TextStyle(
                          color: Color.fromARGB(255, 173, 40, 30),
                          fontSize: 18),
                ),
                Text(
                  DateFormat('dd-MM-yyyy hh:mm')
                      .format(DateTime.parse(task.date)),
                  style: task.isDeleted == false
                      ? null
                      : const TextStyle(
                          color: Color.fromARGB(255, 173, 40, 30)),
                ),
              ],
            ),
          ],
        ),
        Row(children: [
          Checkbox(
            value: task.isDone,
            onChanged: task.isDeleted == false
                ? (value) {
                    context.read<TasksBloc>().add(UpdateTask(task: task));
                  }
                : null,
          ),
          PopupMenu(
            task: task,
            cancelOrDeleteCallback: () {
              _removedOrDeletedTask(context, task);
            },
            editTaskCallback: () {
              _editTask(context);
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ]),
      ],
    );
  }
}
