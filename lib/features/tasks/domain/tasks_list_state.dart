import 'package:flutter/foundation.dart';
import '../../../core/widget/task.dart';

class TaskState extends ChangeNotifier {
  final Map<String, List<Task>> _tasks = {};
  final String _date = '';
  String get date => _date;
  List<Task> getTaskByDate(String Date){
    return _tasks[Date] ?? [];
  }

  void printMapTask(){
    if (kDebugMode) {
      print(_tasks);
    }
  }

  void addTask(String Date, Task task){
    if (kDebugMode) {
      print('task_state: Дата $Date');
    }
    if(_tasks[Date] == null) {
      _tasks[Date] = [task];
    } else {
      _tasks[Date]?.add(task);
    }

    if (kDebugMode) {
      print('#task_state - Добавлена новая задача на дату: $_tasks');
    }
    notifyListeners();
  }

  void removeTask(String Date, Task task){
    _tasks[_date]?.remove(task);
    notifyListeners();
  }
}