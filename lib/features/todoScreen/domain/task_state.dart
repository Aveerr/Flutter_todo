import 'package:flutter/material.dart';

import '../../../core/widget/task.dart';

class TaskState extends ChangeNotifier {
  final List<CreateTask> _tasks = [];
  String _date = '';

  List<CreateTask> get task => _tasks;
  String get date => _date;

  void addTask(CreateTask task, String Date){
    _tasks.add(task);
    _date = Date;
    print('Добавлена новая задача на дату: $_date');
    notifyListeners();
  }
}