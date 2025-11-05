import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/calendar/domain/calendar_state.dart';
import 'package:untitled2/theme/app_gradients.dart';
import '../presentation/todo_text_title.dart';
import '../../calendar/presentation/calendar.dart';
import 'todo_appbar.dart';
import '../../tasks/presentation/tasks_list.dart';
import 'todo_floating_action_button.dart';



class TodoScreen extends StatefulWidget{
  const TodoScreen({super.key});
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TodoAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black54,
        ),

        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 220,
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color.fromRGBO(237, 154, 129, 1),
                            Color.fromRGBO(105, 164, 171, 1),
                            Color.fromRGBO(60, 159, 174, 1), // светло-серый, почти белый
                          ],
                        ),
                      ),
                    ),
                  ),
                  ToDoCalendar(),
                ],
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      width:MediaQuery.of(context).size.width * 0.95,
                      height:MediaQuery.of(context).size.height * 0.718,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(255, 255, 255, 1.0),
                            Color.fromRGBO(200, 200, 200, 1.0),
                            Color.fromRGBO(255, 255, 255, 1.0),
                            Color.fromRGBO(200, 200, 200, 1.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 30),
                        child: ToDoTaskContainer()
                    ),
                  )
                ],
              ),

            ]
          )
        ),


      ),
      floatingActionButton: ToDoFloatingActionButton()
    );
  }
}