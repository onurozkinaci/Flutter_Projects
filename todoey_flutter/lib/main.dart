import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Task> tasks = [
    Task(taskName: 'Buy milk'),
    Task(taskName: 'Buy eggs'),
    Task(taskName: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return Provider<List<Task>>(
      create: (context) => tasks,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
