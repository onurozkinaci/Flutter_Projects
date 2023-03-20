import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  /*final Function(String taskName) onAddItem;
  AddTaskScreen(this.onAddItem);*/

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFF757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              controller: textController,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
                onPressed: () {
                  //setState(() {
                  //widget.onAddItem(textController.text);
                  //denemetextController.clear();
                  //----------------------------------------
                  //**To add a new task with the usage of State Management via 'Provider.of()';
                  Provider.of<TaskData>(context, listen: false)
                      .addNewTask(textController.text);
                  Navigator.pop(context); //butona tiklandiktan sonra
                  // pop-up kapanir ve TaskScreen ekranina geri donulur.
                  //});
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.lightBlueAccent)),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

/*ElevatedButton(
  onPressed: null,
  style: ButtonStyle(
      backgroundColor:
          MaterialStatePropertyAll(Colors.lightBlueAccent),
      fixedSize: MaterialStatePropertyAll(Size.fromWidth(250.0))),
  child: Text(
    'Add',
    style: TextStyle(color: Colors.white),
  ),
)
 */
