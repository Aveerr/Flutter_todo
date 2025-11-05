import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/task.dart';

class TaskState extends ChangeNotifier {
  final Map<String, List<dynamic>> _tasks = {};
  List<dynamic> getTaskByDate(String date){
    return _tasks[date] ?? [];
  }

  void printMapTask(){
    if (kDebugMode) {
      print(_tasks);
    }
  }

  void addTask(String date, TimeOfDay taskStartTime, TimeOfDay taskEndTime, Task task){
    if (kDebugMode) {
      print('task_state: Дата $date');
    }

    if(_tasks[date] == null) {
      _tasks[date] = [task, taskStartTime];
    } else {
      _tasks[date]?.add(task);
    }

    if (kDebugMode) {
      print('#task_state - Добавлена новая задача на дату: $_tasks');
    }
    notifyListeners();
  }

  void removeTask(String date, Task task){
    _tasks[date]?.remove(task);
    notifyListeners();
  }
}