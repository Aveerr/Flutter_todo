import 'package:flutter/material.dart';

class TodoTextTitle extends StatelessWidget{
  const TodoTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Задачи',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30,
                color: Color.fromRGBO(233, 231, 230, 1)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'На день',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Montserrat',
                color: Color.fromRGBO(246, 246, 244, 1),
                fontWeight: FontWeight.bold

              ),
            ),
          ),
        ],
      ),
    );
  }

}