import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  /*List<Task> tasks;
  TasksList(this.tasks);*/

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  /*List<Task> tasks = [
    Task(taskName: 'Buy milk'),
    Task(taskName: 'Buy eggs'),
    Task(taskName: 'Buy bread'),
  ];
   */

  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<List<Task>>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          nameOfTask: tasks[index].taskName,
          isChecked: tasks[index].isDone,
          callbackFunction: (changedState) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks.length, //widget.tasks.length,
    );
  }
}
