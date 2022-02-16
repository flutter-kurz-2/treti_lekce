import 'package:flutter/material.dart';
import 'package:treti_lekce/widgets/checkbox.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        CustomCheckbox(),
        Text("This is ToDo Item"),
      ],
    );
  }
}