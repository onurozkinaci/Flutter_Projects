import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  /*List<Task> tasks;
  TasksList(this.tasks);*/

  /*List<Task> tasks = [
    Task(taskName: 'Buy milk'),
    Task(taskName: 'Buy eggs'),
    Task(taskName: 'Buy bread'),
  ];
  */

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.taskList[index];
            return TaskTile(
              nameOfTask: task.taskName,
              isChecked: task.isDone,
              callbackFunction: (changedState) {
                /*setState(() {
                tasks[index].toggleDone();
              });*/
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount, //widget.tasks.length,
        );
      },
    );
  }
}
