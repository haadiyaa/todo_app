import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/screens/recycle_bin.dart';
import 'package:todo_app/screens/tabs_screen.dart';

class DrawerPanel extends StatelessWidget {
  DrawerPanel({super.key});

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 10,
        shadowColor: Colors.black,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                'Task Drawer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder),
                    title: const Text('My Tasks'),
                    trailing: Text('${state.pendingTasks.length}'),
                  ),
                );
              },
            ),
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
            ListTile(
              title: const Text('Theme'),
              trailing: BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Switch(
                    value: state.switchValue,
                    onChanged: (newValue) {
                      newValue
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
