import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/add_task_screen.dart';
import '../widgets/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addTask(BuildContext context){
    showModalBottomSheet(context: context, builder: (context)=>SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const AddTaskScreen(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList=state.allTasks;
        return Scaffold(
          appBar: AppBar(
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: const Icon(
            //         Icons.add,
            //         size: 30,
            //       ))
            // ],
            leading: const Icon(
              Icons.format_list_numbered_rounded,
              size: 30,
            ),
            shadowColor: Colors.black,
            elevation: 2,
            title: const Text(
              'To-Do',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text('Tasks:'),
                ),
              ),
              TaskList(tasksList: tasksList),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            hoverColor: Colors.green,
            onPressed: () {_addTask(context);},
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
