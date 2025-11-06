import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/task.dart';


class TaskEntry {
  final Task task;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  Task get getTask => task;
  TaskEntry({
    required this.task,
    required this.startTime,
    required this.endTime,
  });

  @override
  String toString() {
    return 'TaskEntry{task: $task, start: $startTime, end: $endTime}';
  }
}
class TaskState extends ChangeNotifier {
  final Map<String, List<TaskEntry>> _tasks = {};
  List<TaskEntry> getTaskByDate(String date){
    return _tasks[date] ?? [];
  }

  void printMapTask(){
    if (kDebugMode) {
      print(_tasks);
    }
  }

  void addTask(String date, TimeOfDay taskStartTime, TimeOfDay taskEndTime, Task task){
    final _tsk = TaskEntry(
      task: task,
      startTime: taskStartTime,
      endTime: taskEndTime,
    );

    if (kDebugMode) {
      print('task_state: Дата $date');
    }

    if(_tasks[date] == null) {
      _tasks[date] = [_tsk];
    } else {
      _tasks[date]?.add(_tsk);
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