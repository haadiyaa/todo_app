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
            // actions: [
            //   IconButton(
            //       onPressed: () {_addTask(context);},
            //       icon: const Icon(
            //         Icons.add,
            //         size: 30,
            //       ))
            // ],
            // leading: const Icon(
            //   Icons.format_list_numbered_rounded,
            //   size: 30,
            // ),
            shadowColor: Colors.black,
            elevation: 2,
            title: const Text(
              'Recycle Bin',
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
