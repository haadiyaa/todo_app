import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/drawer_panel.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/add_task_screen.dart';
import '../widgets/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const id='homescreen';

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
              'To-Do',
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
                padding:const  EdgeInsets.only(left: 20,top: 10),
                child: Text('${state.allTasks.length} tasks to do',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ),
              const Divider(),
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
