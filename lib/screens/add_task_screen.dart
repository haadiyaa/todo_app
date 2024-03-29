import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/services/guid_gen.dart';

class AddTaskScreen extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Form(
            key: _key,
            child: TextFormField(
              validator: (value) {
                if (titleController.text.isEmpty) {
                  return 'Enter your task!';
                }
              },
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Add Title',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    var task = Task(
                      date: DateTime.now().toString(),
                      title: titleController.text,
                      id: GUIDGen.generate(),
                    );
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
