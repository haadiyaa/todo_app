import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        Row(
          children: [
            SizedBox(width:10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  DateFormat('dd-MM-yyyy hh:mm').format(DateTime.now()),
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
          PopupMenuButton(
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    ),
                    onTap: (){},
                  ),
                ]),
          ),
        ]),
      ],
    );
  }
}

// ListTile(
//      
//       trailing: 
//       onLongPress: () {
//         _removedOrDeletedTask(context, task);
//       },
//     );