import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function checkboxCallback;

  TaskTile({this.isChecked, this.title, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function toggleCheckboxState;

  TaskCheckbox(this.checkboxState, this.toggleCheckboxState);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      activeColor: Colors.lightBlueAccent,
      onChanged: toggleCheckboxState,
    );
  }
}
