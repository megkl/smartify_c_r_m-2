import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smartify_c_r_m/database/task_db_helper.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:smartify_c_r_m/model/project_model.dart';
import 'package:smartify_c_r_m/model/task_model.dart';

import '../../../auth/firebase_user_provider.dart';
import '../../../database/project_db_helper.dart';
import '../schedule_screen.dart';
import '../widgets/project_card.dart';
import '../widgets/task_item.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final taskDb = TaskDatabaseHelper();
  final projectDb = ProjectDatabaseHelper();
  //final tasksList = TaskModel.todoList();
  List<TaskModel> tasksList = [];
  List<TaskModel> _foundTask = [];
  final _taskController = TextEditingController();
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String? selectedStatus;
  ProjectModel? project;
  bool isActive = false;
  List<ProjectModel> projects = [];
  @override
  void initState() {
    getTasks();
    _foundTask = tasksList;
    dateController = new TextEditingController(
        text: '${DateFormat('EEE, MMM d, ' 'yy').format(this.selectedDate)}');
    startTimeController = new TextEditingController(
        text: '${DateFormat.jm().format(DateTime.now())}');
    endTimeController = new TextEditingController(
        text: '${DateFormat.jm().format(DateTime.now().add(
      Duration(hours: 1),
    ))}');
    _selectedDay = _focusedDay;
    super.initState();
  }

  void getTasks() async {
    projects = await projectDb.getAllProject();
    tasksList = await taskDb.getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Tasks',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            showAddTaskDialog();
          },
        ),
        onPressed: () {},
      ),
      body: Stack(
        children: [
          // searchBox(),
          //       SizedBox(height: 40,),
          Container(
            height: 500,
            padding: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 15,
            ),
            child: FutureBuilder(
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
                    : ListView.builder(
                        itemCount: tasksList.length,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 12),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              //  width: SizeConfig.screenWidth * 0.78,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: kPrimaryColor,
                              ),
                              child: Row(children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tasksList[i].taskName!,
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.access_time_rounded,
                                            color: Colors.grey[200],
                                            size: 18,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            tasksList[i].startTime == null
                                                ? ''
                                                : '${tasksList[i].startTime} - ${tasksList[i].endTime}',
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[100]),
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            tasksList[i].date == null
                                                ? ''
                                                : tasksList[i].date!,
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[100]),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        tasksList[i].taskDescription!,
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[100]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: 60,
                                  width: 0.5,
                                  color: Colors.grey[200]!.withOpacity(0.7),
                                ),
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    tasksList[i].status! ==
                                            ProjectStatus.todo.name
                                        ? 'To Do'
                                        : tasksList[i].status! ==
                                                ProjectStatus.inProgress.name
                                            ? 'In Progress'
                                            : 'Completed',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: 60,
                                  width: 0.5,
                                  color: Colors.grey[200]!.withOpacity(0.7),
                                ),
                                RotatedBox(
                                    quarterTurns: 4,
                                    child: GestureDetector(
                                        onTap: () {
                                          delete(
                                              task: tasksList[i],
                                              context: context);
                                        },
                                        child: Icon(Icons.delete,
                                            color: Colors.white))),
                              ]),
                            ),
                          );
                        },
                      );
              },
            ),
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
        userId: currentUser!.user!.uid);
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

  showAddTaskDialog() {
    StateSetter _setState;
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Create Task',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: FlutterFlowTheme.of(context).primaryColor),
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              taskNameController.clear();
                            },
                          ))
                    ],
                  ),
                  content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    _setState = setState;
                    return SingleChildScrollView(
                        child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: textFormFields(
                              context: context,
                              controller: taskNameController,
                              hintText: 'e.g Define project scope',
                              labelText: 'Task Name')),
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: textFormFields(
                              context: context,
                              controller: taskDescController,
                              hintText: 'Describe your task.',
                              labelText: 'Description',
                              maxLines: 5)),
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: textFormFields(
                            context: context,
                            controller: dateController,
                            labelText: 'Date',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: Icon(
                                Icons.calendar_month_outlined,
                                color: kPrimaryColor,
                              ),
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.33,
                                      child: textFormFields(
                                        context: context,
                                        controller: startTimeController,
                                        labelText: 'Start Time',
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            _selectTime(context, "StartTime");
                                          },
                                          child: Icon(
                                            Icons.alarm,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.33,
                                      child: textFormFields(
                                        context: context,
                                        controller: endTimeController,
                                        labelText: 'End Time',
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            _selectTime(context, "EndTimeTime");
                                          },
                                          child: Icon(
                                            Icons.alarm,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Project",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 20,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    children: [
                                      for (var i in projects)
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                this.project = i;
                                                this.isActive ? this.isActive = false:this.isActive = true;
                                              });
                                            },
                                            child: Container(
                                                margin: EdgeInsets.all(5),
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: this.project == null ? Color.fromRGBO(
                                                          221, 229, 249, 1):this.project!.projectName! != i.projectName
                                                      ? Color.fromRGBO(
                                                          221, 229, 249, 1)
                                                      : kPrimaryColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                                child: Text(
                                                  i.projectName!,
                                                  style: GoogleFonts.montserrat(
                                                    color: this.project == null ? Colors.grey:this.project!.projectName! != i.projectName
                                                        ? Colors.grey
                                                        : Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                addTask();
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kPrimaryColor,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Create Task",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]));
                  })),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }

  Widget textFormFields(
      {controller,
      hintText,
      labelText,
      onChanged,
      textInputType,
      icon,
      BuildContext? context,
      Widget? suffixIcon,
      maxLines}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: TextFormField(
        controller: controller,
        validator: (val) {
          if (val!.isEmpty) {
            return "Enter your $hintText";
          }
          return null;
        },
        onChanged: onChanged,
        keyboardType: textInputType,
        maxLines: maxLines,
        style: FlutterFlowTheme.of(context!).bodyText1.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
        decoration: new InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          suffixIcon: suffixIcon,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: kPrimaryColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: kPrimaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.redAccent, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: EdgeInsets.only(
            left: 16,
            bottom: 16,
            top: 16,
            right: 16,
          ),
          hintText: hintText,
          hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
          errorStyle: TextStyle(
            fontSize: 12,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }

  addTask() async {
    TaskModel taskObj = TaskModel(
        taskName: taskNameController.text,
        taskDescription: taskDescController.text,
        status: ProjectStatus.todo.name,
        userId: currentUser!.user!.uid,
        color: '',
        endTime: endTimeController.text,
        startTime: startTimeController.text,
        date: dateController.text,
        projectId: this.project!.id!.toString());
    try {
      await _insertTask(taskObj);
    } catch (e) {
    } finally {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => CalendarScheduleScreen(index: 2))));
      return;
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2005),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        dateController.text =
            '${DateFormat('EEE, MMM d, ' 'yy').format(selected)}';
      });
    }
  }

  _selectTime(BuildContext context, String Timetype) async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        if (Timetype == "StartTime") {
          startTimeController.text = result.format(context);
        } else {
          endTimeController.text = result.format(context);
        }
      });
    }
  }

  void delete({required TaskModel task, required BuildContext context}) async {
    taskDb.deleteTask(task.id!).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task successfully deleted')));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => CalendarScheduleScreen(
                    index: 2,
                  ))));
    }).catchError((e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    });
  }
}
