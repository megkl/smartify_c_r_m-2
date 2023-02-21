
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../database/notes_db_helper.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../model/note_model.dart';
import '../widgets/note_widget.dart';
import 'notes_edit_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    initDb();
    getTodos();
    super.initState();
  }

  void initDb() async {
    await NotesDatabaseHelper.instance.database;
  }

  List<ToDoModel> myTodos = [];
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getTodos();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: gotoAddScreen,
        ),
        appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        foregroundColor: kWhiteColor,
        title: Text('My Notes'), 
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          
        ],
    ),
        body: myTodos.isEmpty
            ? const Center(child: const Text('You don\'t have any notes yet'))
            : ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final todo = myTodos[index];
                  return TodoWidget(
                    todo: todo,
                    onDeletePressed: () {
                      delete(todo: todo, context: context);
                      getTodos();
                    },
                  );
                },
                itemCount: myTodos.length,
              ),
      ),
    );
  }

  void getTodos() async {
    await NotesDatabaseHelper.instance.getAllTodos().then((value) {
      setState(() {
        myTodos = value;
      });
    }).catchError((e) => debugPrint(e.toString()));
  }

  void gotoAddScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddTodoScreen();
    }));
  }

  void delete({required ToDoModel todo, required BuildContext context}) async {
    NotesDatabaseHelper.instance.delete(todo.id!).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Deleted')));
    }).catchError((e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    });
  }
}