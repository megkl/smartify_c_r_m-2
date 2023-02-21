import 'package:flutter/material.dart';
import 'package:smartify_c_r_m/model/task_model.dart';

import '../../../model/note_model.dart';
import '../notes/notes_edit_screen.dart';

class TodoWidget extends StatelessWidget {
  final ToDoModel todo;
  final VoidCallback onDeletePressed;

  const TodoWidget({
    Key? key,
    required this.todo,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddTodoScreen(
            todo: todo,
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: IconButton(
            onPressed: onDeletePressed,
            icon: Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
          trailing: todo.isImportant == true
              ? Icon(
                  Icons.warning_amber,
                  color: Colors.red,
                )
              : SizedBox(),
          subtitle: Text(
            todo.title,
            style: const TextStyle(color: Colors.black87, fontSize: 12),
          ),
          title: Text(
            todo.describtion,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.1)),
      ),
    );
  }
}
