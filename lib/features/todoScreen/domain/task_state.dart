import 'package:flutter/material.dart';

class TaskState extends ChangeNotifier {
  final List<Widget> _tasks = [];

  List<Widget> get task => _tasks;

  void addTask(Widget task){
    _tasks.add(task);
    notifyListeners();
  }
}