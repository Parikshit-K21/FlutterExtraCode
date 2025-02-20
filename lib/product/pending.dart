// pending.dart
import 'dart:math';

import 'package:dynaa/jsonfolder/pendingjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tasksProvider = StateNotifierProvider<TasksNotifier, List<Task>>((ref) {
  return TasksNotifier(tasks);
});

// For synchronous in-memory JSON:
final tasks = getTasksFromJson();

// For loading from asset file:
Future<void> loadTasks() async {
  final tasks2 = await loadTasksFromFile();
  // Use tasks here
}


class TasksNotifier extends StateNotifier<List<Task>> {
  TasksNotifier( List<Task> tasks) : super(tasks); // Fixed: Initialize with tasks parameter instead of empty list

  void toggleTask(String id) {
    state = [
      for (final task in state)
        if (task.id == id)
          Task(
            id: task.id,
            title: task.title,
            isCompleted: !task.isCompleted,
          )
        else
          task,
    ];
  }
}




class PendingTasksList extends ConsumerWidget {
  const PendingTasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);
    final pendingTasks = tasks.where((task) => !task.isCompleted).toList();

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(1),
      child: pendingTasks.isEmpty
          ? Center(
              child: Text(
                'No pending tasks!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            )
          : 
        
          
          ListView.builder(
              itemCount: pendingTasks.length,
              itemBuilder: (context, index) {
                final task = pendingTasks[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Complete Task'),
                              content: const Text(
                                'Are you sure you want to mark this task as complete?'),
                              actions: [
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Complete'),
                                  onPressed: () {
                                    ref.read(tasksProvider.notifier)
                                        .toggleTask(task.id);
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Task completed!'),
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
