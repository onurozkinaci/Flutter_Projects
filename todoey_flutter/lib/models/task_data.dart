import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(taskName: 'Buy milk'),
    Task(taskName: 'Buy eggs'),
    Task(taskName: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addNewTask(String newTask) {
    _tasks.add(Task(taskName: newTask));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
