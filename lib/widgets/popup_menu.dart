import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';

class PopupMenu extends StatelessWidget {

  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback editTaskCallback;

  const PopupMenu({
    super.key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.editTaskCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                     onTap: editTaskCallback,
                     child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                  ),

                  PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    ),
                  ),
                ])
            : (context) => [
                  
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete Forever'),
                    ),
                  ),
                ]);
  }
}
