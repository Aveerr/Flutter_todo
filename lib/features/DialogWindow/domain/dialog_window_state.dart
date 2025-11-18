import 'package:flutter/material.dart';

import '../../../core/widget/task.dart';


class DialogWindowState extends ChangeNotifier {
  String? title;
  TimeOfDay? _taskStartTime;
  TimeOfDay? _taskEndTime;
  Task? widget;
  TextEditingController? textController;

  TimeOfDay? get getTaskStartTime => _taskStartTime;
  TimeOfDay? get getTaskEndTime => _taskEndTime;
  Task? get getTask => widget;

  TextEditingController? get getController => textController;

  String? get getTitle => title;

  void setTaskStartTime(TimeOfDay time){
    print('#dialog_window_state: установленной начальное время');
    _taskStartTime = time;
    notifyListeners();
  }

  void setTaskEndTime(TimeOfDay time){
    print('#dialog_window_state: установленной конечное время');
    _taskEndTime = time;
    notifyListeners();
  }

  void setTask(Task task){
    print('#dialog_window_state: добавленна задача');
    widget = task;
    notifyListeners();
  }

  void setTextController(TextEditingController controller){
    print('#dialog_window_state: установленной начальное время');
    textController = controller;
    notifyListeners();
  }

  void setTitle(String newTitle){
    print('#dialog_window_state: установленной начальное время');
    title = newTitle;
    notifyListeners();
  }
}