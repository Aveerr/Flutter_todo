import 'package:flutter/material.dart';
import '../../../core/widget/task.dart';
class DialogWindowState extends ChangeNotifier {
  String _title = '';
  TimeOfDay? _taskStartTime;
  TimeOfDay? _taskEndTime;
  Task? _widget;
  TextEditingController? _textController;

  TimeOfDay? get getTaskStartTime => _taskStartTime;
  TimeOfDay? get getTaskEndTime => _taskEndTime;
  Task? get getTask => _widget;
  TextEditingController? get getController => _textController;
  String get getTitle => _title;

  void setTaskStartTime(TimeOfDay time){
    print('#dialog_window_state: установленной начальное время $time');
    _taskStartTime = time;
  }

  void setTaskEndTime(TimeOfDay time){
    print('#dialog_window_state: установленной конечное время $time');
    _taskEndTime = time;
  }

  void setTask(Task task){
    print('#dialog_window_state: добавленна задача');
    _widget = task;
  }

  void setTextController(TextEditingController controller){
    print('#dialog_window_state: установленной начальное время');
    _textController = controller;
  }

  void setTitle(String newTitle){
    print('#dialog_window_state: установленно новое название $newTitle');
    _title = newTitle;
    print('#setTitle newtitle: ${_widget?.title}');
  }

  void update(){
    _widget?.setTaskStartTime(getTaskStartTime!);
    _widget?.setTaskEndTime(getTaskEndTime!);
    _widget?.setTitle(_title);
    notifyListeners();
  }
}