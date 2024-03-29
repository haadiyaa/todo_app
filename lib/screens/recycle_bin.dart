import 'package:flutter/material.dart';
import 'package:todo_app/screens/drawer_panel.dart';
import 'package:todo_app/widgets/tasks_list.dart';

import '../blocs/bloc_exports.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: Colors.black,
            elevation: 2,
            title: const Text(
              'Recently Deleted',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          drawer: DrawerPanel(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  '${state.removedTasks.length} Deleted Tasks',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const Divider(),
              TaskList(tasksList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
