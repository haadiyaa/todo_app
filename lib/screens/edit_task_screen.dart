import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/services/guid_gen.dart';

class EditTaskScreen extends StatelessWidget {
  final _key = GlobalKey<FormState>();

  final Task oldTask;

  EditTaskScreen({
    super.key,
    required this.oldTask,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Form(
            key: _key,
            child: TextFormField(
              validator: (value) {
                if (titleController.text.isEmpty) {
                  return 'Enter something!';
                }
              },
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Edit Title',
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
                    var editedTask = Task(
                      date: DateTime.now().toString(),
                      title: titleController.text,
                      id: oldTask.id,
                      isDone: false,
                    );
                    context.read<TasksBloc>().add(EditTask(oldTask: oldTask, newTsak: editedTask));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
