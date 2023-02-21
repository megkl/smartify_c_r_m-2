import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartify_c_r_m/database/task_db_helper.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:smartify_c_r_m/model/task_model.dart';

import '../../../auth/firebase_user_provider.dart';
import '../widgets/task_item.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
    final taskDb = TaskDatabaseHelper();
  //final tasksList = TaskModel.todoList();
  List<TaskModel> tasksList = [];
  List<TaskModel> _foundTask = [];
  final _taskController = TextEditingController();

  @override
  void initState() {
    getTasks();
    _foundTask = tasksList;
    super.initState();
  }
   void getTasks() async {
    tasksList = await taskDb.getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text(
          'Tasks',
        ),
      ),
      
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: searchBox()),
                SizedBox(height: 20,),
          Container(
            height: 450,
            padding: EdgeInsets.only(
              left: 20,
              right: 30,
              top: 80
            ),
            child: 
                FutureBuilder(
                future: taskDb.getAllTask(),
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var data = snapshot
                      .data!; // this is the data we have to show. (list of todo)
                  var datalength = data.length;
                  return datalength == 0
                      ? const Center(
                          child: Text('no data found'),
                        )
                      : 
                       ListView.builder(
                    itemCount: datalength,
                          itemBuilder: (context, i) =>
                          TaskItem(
                          task: data[i],
                          onTaskChanged: _handleTaskChange,
                          onDeleteItem: _deleteTaskItem,
            ));
  },
                  ),
                ),
            
           
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                        hintText: 'Add a new task item',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  onPressed: () {
                    _addTaskItem(_taskController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    minimumSize: Size(50, 50),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleTaskChange(TaskModel task) {
    setState(() {
      task.status = ProjectStatus.completed.name;
    });
  }

  void _deleteTaskItem(String id) {
    setState(() {
      tasksList.removeWhere((item) => item.id == id);
    });
  }

  Future<void> _addTaskItem(String toDo) async {
    TaskModel taskObj = TaskModel(
				taskName: toDo, 
				taskDescription: '', 
				status: ProjectStatus.todo.name,
        userId: currentUser!.user!.uid
			);
			try {
				await _insertTask(taskObj);
        //(context as Element).reassemble();
			} catch (e) {

			} finally {
				return;
			}
  }
  	Future<void> _insertTask(TaskModel task) async {
	  TaskDatabaseHelper tasksDb = TaskDatabaseHelper();
	  await tasksDb.initDatabase();
	  int result = await tasksDb.insertTask(task);
	  //await tasksDb.closeDatabase();
	}


  void _runFilter(String enteredKeyword) {
    List<TaskModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = tasksList;
    } else {
      results = tasksList
          .where((item) => item.taskName!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundTask = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }

}