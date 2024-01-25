import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({super.key});

  static const id = 'PendingTasksScreen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                '${state.pendingTasks.length} Tasks to do',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const Divider(),
            TaskList(tasksList: tasksList),
          ],
        );
      },
    );
  }
}
