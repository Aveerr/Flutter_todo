import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/widget/task.dart';

import '../domain/dialog_window_state.dart';
import 'dialog_window_topbar.dart';

Future<TimeOfDay?> _selectTime(BuildContext context, TimeOfDay? initialTime) async {
  return await showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(), // если null — используем текущее время
  );
}
Future<dynamic> showDialogWindow(BuildContext context, String title, Task widget)
{
  final TextEditingController controller = TextEditingController();
  final dialogState = context.read<DialogWindowState>();
  dialogState.setTask(widget);
  dialogState.setTaskEndTime(widget.taskEndTime!);
  dialogState.setTaskStartTime(widget.taskStartTime!);
  controller.text = widget.title;

  return showDialog(
    context: context,
    builder: (context) => Dialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          width: 400,
          height: 400,
          child: Column(
            children: [
              DialogWindowTopbar(widget: widget),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1.4,
                  ),
                ),
                child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                  ],
                  controller: controller,
                  onTapOutside:  (event){
                    final dialogState = context.read<DialogWindowState>();
                    dialogState.setTitle(controller.text);
                  },
                  onEditingComplete:  (){
                    final dialogState = context.read<DialogWindowState>();
                    dialogState.setTitle(controller.text);
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    hintText: 'Введите название задачи',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.black),
                ), // ПОЛЕ ДЛЯ НОВОГО НАЗВАНИЯ ЗАДАЧИ
              ),
              Container(
                  padding:  EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 250, 251, 1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 1.4,
                      )
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        //Padding(padding: EdgeInsets.only(top: 00)),
                        Expanded(
                          child: Container(
                            width: 130,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                  width: 1.4,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Consumer<DialogWindowState>(
                              builder: (context, dialogState, child) {
                                return TextButton(
                                  onPressed: () async {
                                    final pick = await _selectTime(context, dialogState.getTaskStartTime);
                                    if (pick != null) {
                                      dialogState.setTaskStartTime(pick);
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Icon(Icons.access_time, color: Colors.black),
                                      ),
                                      Text(
                                        dialogState.getTaskStartTime?.format(context) ?? "начало", // берем из провайдера
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ),
                        ), ///Начало задачи

                        Container(
                          margin: EdgeInsets.all(10),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),

                        Expanded(
                          child: Container(
                            width: 130,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                  width: 1.4,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Consumer<DialogWindowState>(
                              builder: (context, dialogState, child) {
                                return TextButton( //КОНЕЦ ВРЕМЕНИ
                                  onPressed: () async {
                                    final pick = await _selectTime(context, dialogState.getTaskEndTime);
                                    print(pick);
                                    dialogState.setTaskEndTime(pick!);
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsGeometry.symmetric(
                                            horizontal: 5),
                                        child: Icon(
                                          Icons.access_time,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        dialogState.getTaskEndTime?.format(
                                            context) ?? "конец",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ),
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    ),
  );
}