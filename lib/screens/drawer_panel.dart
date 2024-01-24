import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/homescreen.dart';
import 'package:todo_app/screens/recycle_bin.dart';

class DrawerPanel extends StatefulWidget {
  const DrawerPanel({super.key});

  @override
  State<DrawerPanel> createState() => _DrawerPanelState();
}

class _DrawerPanelState extends State<DrawerPanel> {

  bool switchValue=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 10,
        shadowColor: Colors.black,
        backgroundColor: Colors.amber,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.grey,
              child: Text(
                'task drawer',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(HomeScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder),
                    title: const Text('My Tasks'),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Recently Deleted'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),
            Switch(
              value: switchValue,
              onChanged: (newValue) {
                setState(() {
                  switchValue=newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
