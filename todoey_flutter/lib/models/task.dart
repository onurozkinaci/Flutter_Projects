import 'package:flutter/material.dart';

class Task {
  final String taskName;
  bool isDone;

  //default olarak To Do List'e eklenen tasklar tamamlanmadigindan isDone propertyleri
  //false'tur.
  Task({this.taskName = 'MyTask', this.isDone = false});

  void toggleDone() {
    //mevcut degerin zittina esitleme yapacak sekilde atama saglar;
    isDone = !isDone;
  }
}
