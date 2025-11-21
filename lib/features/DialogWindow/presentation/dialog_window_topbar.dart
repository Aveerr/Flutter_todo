import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widget/task.dart';
import '../domain/dialog_window_state.dart';

void update(Task widget, BuildContext context) {
  print('вызван апдейт');
  final dialogState = context.read<DialogWindowState>();
  dialogState.update();
}
class DialogWindowTopbar extends StatefulWidget {
  final Task widget;

  const DialogWindowTopbar(
    {super.key, required this.widget}
  );

  @override
  State<DialogWindowTopbar> createState() => _DialogWindowTopbarState();
}

class _DialogWindowTopbarState extends State<DialogWindowTopbar> {
  @override
  Widget build(BuildContext context) {
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
              update(widget.widget, context);
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
