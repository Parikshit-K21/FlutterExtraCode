// First, create a fromJson constructor in your Task class
import 'dart:convert';

import 'package:flutter/services.dart';

class Task {
  final String id;
  final String title;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  // Add fromJson constructor
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
    );
  }

  // Add toJson method (useful for saving tasks)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}

// Function to load tasks from JSON string
List<Task> getTasksFromJson() {
  // This would typically come from a file or API
  const String jsonString = '''
    {
      "tasks": [
        {
          "id": "1",
          "title": "Complete project documentation",
          "isCompleted": false
        },
        {
          "id": "2",
          "title": "Review pull request",
          "isCompleted": true
        },
        {
          "id": "3",
          "title": "Debug login feature",
          "isCompleted": false
        },
        {
          "id": "4",
          "title": "Update dependencies",
          "isCompleted": false
        },
        {
          "id": "5",
          "title": "Write unit tests",
          "isCompleted": true
        }
      ]
    }
  ''';

  // Parse JSON
  final Map<String, dynamic> decodedJson = json.decode(jsonString);
  final List<dynamic> taskList = decodedJson['tasks'];
  
  // Convert JSON to Task objects
  return taskList.map((taskJson) => Task.fromJson(taskJson)).toList();
}

// If you want to load from an actual JSON file:
Future<List<Task>> loadTasksFromFile() async {
  try {
    final String jsonString = await rootBundle.loadString('assets/tasks.json');
    final Map<String, dynamic> decodedJson = json.decode(jsonString);
    final List<dynamic> taskList = decodedJson['tasks'];
    return taskList.map((taskJson) => Task.fromJson(taskJson)).toList();
  } catch (e) {
    print('Error loading tasks: $e');
    return [];
  }
}
