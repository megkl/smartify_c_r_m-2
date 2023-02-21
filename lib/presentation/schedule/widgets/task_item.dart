import 'package:flutter/material.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:smartify_c_r_m/model/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final onTaskChanged;
  final onDeleteItem;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onTaskChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          // print('Clicked on Todo Item.');
          onTaskChanged(task);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          task.status == ProjectStatus.completed.name ? Icons.check_box : Icons.check_box_outline_blank,
          color: kPrimaryColor,
        ),
        title: Text(
          task.taskName!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: task.status == ProjectStatus.completed.name ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              //onDeleteItem(task.id);
            },
          ),
        ),
      ),
    );
  }
}