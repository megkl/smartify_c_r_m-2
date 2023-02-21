import 'package:flutter/material.dart';
import 'package:smartify_c_r_m/database/notes_db_helper.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:smartify_c_r_m/presentation/schedule/schedule_screen.dart';

import '../../../model/note_model.dart';

class AddTodoScreen extends StatefulWidget {
  ToDoModel? todo;
  AddTodoScreen({Key? key, this.todo}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  bool important = false;
  final titleController = TextEditingController();
  final subtitleControler = TextEditingController();

  @override
  void initState() {
    addTodoData();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleControler.dispose();
    super.dispose();
  }
  bool isLoading = false;
  void addTodoData() {
    if (widget.todo != null) {
      if (mounted)
        setState(() {
          titleController.text = widget.todo!.title;
          subtitleControler.text = widget.todo!.describtion;
          important = widget.todo!.isImportant;
        });
    }
  }

  void addTodo() async {
    ToDoModel todo = ToDoModel(
        title: titleController.text,
        describtion: subtitleControler.text,
        isImportant: important);
    if (widget.todo == null) {
      setState(() {
        isLoading = true;
      });
      await NotesDatabaseHelper.instance.insert(todo: todo);
      setState(() {
        isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: ((context) => CalendarScheduleScreen(index: 3,))));
    } else {
      setState(() {
        isLoading = true;
      });
      await NotesDatabaseHelper.instance.update(todo);
      Navigator.of(context).pop();
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My note'),
          foregroundColor: kWhiteColor,
          backgroundColor: kPrimaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                    label: const Text('Note title'),
                    hintText: 'Develop amazing app '),
              ),
              const SizedBox(
                height: 36,
              ),
              TextFormField(
                controller: subtitleControler,
                decoration: const InputDecoration(
                  label: const Text('Note subtitle'),
                ),
              ),
              SwitchListTile.adaptive(
                title: Text('is your note really important'),
                value: important,
                onChanged: (value) => setState(
                  () {
                    important = value;
                  },
                ),
              ),
              isLoading?CircularProgressIndicator():MaterialButton(
                
                color: kPrimaryColor,
                height: 50,
                minWidth: double.infinity,
                onPressed: addTodo,
                child: Text(
                  widget.todo == null ? 'Add todo' : 'Update Todo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}