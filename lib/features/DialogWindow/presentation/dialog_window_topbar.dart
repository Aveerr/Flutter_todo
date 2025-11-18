import 'package:flutter/material.dart';

import '../../../core/widget/task.dart';

class DialogWindowTopbar extends StatelessWidget {
  final Task widget;
  final VoidCallback onSave;
  final TextEditingController controller;
  const DialogWindowTopbar(
    {Key? key, required this.widget, required this.onSave, required this.controller}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = widget.title;
    return Row(
      children: [
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: Text(
              'Выйти',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),)
        ), // КНОПКА ВЫХОДА
        Spacer(), //ПУПА
        TextButton(
            onPressed: (){
              widget.title = controller.text;
              onSave();
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
            ),
            child: Text(
              'Сохранить',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            )
        ), // КНОПКА СОХРАНЕНИЯ
      ],
    );
  }
}
