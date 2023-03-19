import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String nameOfTask;
  final bool isChecked;
  final void Function(bool?) callbackFunction;

  TaskTile({
    required this.nameOfTask,
    required this.isChecked,
    required this.callbackFunction,
  });

  //Previously for the `Stateful Widget` version of this `TaskTile` class;
  //=>it will be used as a 'global state'(will be used on more than one widgets).

  /*void toggleCheckboxState(bool checkboxState) {
    //checkboxState's value will be pushed as the 'value' of checkbox  by it's onChanged property when this function is called as a callback.
    setState(() {
      isChecked = checkboxState;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        nameOfTask,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: callbackFunction,
      ),
    );
  }
}

/*class TaskCheckbox extends StatelessWidget {
  final bool checkBoxState;
  final void Function(bool?) toggleCheckboxState;

  TaskCheckbox(
      {required this.checkBoxState, required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkBoxState,
      onChanged: toggleCheckboxState,
    );
  }
}
*/
