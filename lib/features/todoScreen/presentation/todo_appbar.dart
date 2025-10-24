import 'package:flutter/material.dart';


class TodoAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TodoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // делает фон прозрачным
      leading: Padding(
        padding: const EdgeInsets.only(top: 25, left: 15),
        child: IconButton(
          icon: Icon(
            Icons.menu_open_rounded,
            color: Color.fromRGBO(255, 255, 255, 1.0),
            size: 25,
          ),
          onPressed: () {
            // Действие при нажатии на левую иконку
          },
        ),//🧩 Кнопка Меню
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 25, right: 15),
          child: IconButton(
            icon: Icon(
              Icons.calendar_today_outlined,
              color: Color.fromRGBO(255, 255, 255, 1.0),
              size: 20,
            ),
            onPressed: () {
              // Действие при нажатии на правую иконку
            },
          ),//🧩 Кнопка Календарь
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}