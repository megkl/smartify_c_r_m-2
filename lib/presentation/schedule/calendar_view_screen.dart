import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/tasks/v1.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartify_c_r_m/database/project_db_helper.dart';
import 'package:smartify_c_r_m/database/task_db_helper.dart';
import 'package:smartify_c_r_m/model/task_model.dart';
import 'package:smartify_c_r_m/presentation/home/home_screen.dart';
import 'package:smartify_c_r_m/presentation/schedule/project/add_project_screen.dart';
import 'package:smartify_c_r_m/presentation/schedule/schedule_screen.dart';
import 'package:smartify_c_r_m/presentation/schedule/widgets/project_card.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../auth/auth_util.dart';
import '../../auth/firebase_user_provider.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../contact/widget/button_widget.dart';
import 'notes/notes_edit_screen.dart';
import 'widgets/event.dart';

class CalendarViewScreen extends StatefulWidget {
  const CalendarViewScreen({Key? key}) : super(key: key);
  
  @override
  State<CalendarViewScreen> createState() => _CalendarViewScreenState();
}

class _CalendarViewScreenState extends State<CalendarViewScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
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
  String? project = "None";
  final projectDb = ProjectDatabaseHelper();
  final taskDb = TaskDatabaseHelper();
List<TaskModel> tasksByDay =[];
  var projects;
  @override
  void initState() {
    super.initState();
    getProjects();
    dateController = new TextEditingController(
        text: '${DateFormat('EEE, MMM d, ' 'yy').format(this.selectedDate)}');
    startTimeController = new TextEditingController(
        text: '${DateFormat.jm().format(DateTime.now())}');
    endTimeController = new TextEditingController(
        text: '${DateFormat.jm().format(DateTime.now().add(
      Duration(hours: 1),
    ))}');
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    
  }
  
  void getProjects()async{
    projects = await projectDb.getAllProject();
  tasksList = await taskDb.getTasksByDay('${DateFormat('EEE, MMM d, ' 'yy').format(this.selectedDate)}');
  } 

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
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

  _SetCategory(String project) {
    this.setState(() {
      this.project = project;
    });
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  Future<void> _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(()  {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;

      });
        tasksList = await taskDb.getTasksByDay('${DateFormat('EEE, MMM d, ' 'yy').format(selectedDay)}');
      _selectedEvents.value = _getEventsForDay(selectedDay);
     
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: kPrimaryColor,
        backgroundColor: kWhiteColor,
        title: Text(
          'Schedule',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: builSpeedDial(),
        onPressed: () {},
      ),

      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10.0),
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide(color: kPrimaryColor, width: 2.0),
            ),
            child: TableCalendar<Event>(
              headerStyle: HeaderStyle(
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 28,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 28,
                  ),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  titleCentered: true,
                  titleTextStyle: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Outfit',
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                  formatButtonVisible: false),
              daysOfWeekHeight: 50,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                weekendStyle: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: _rangeSelectionMode,
              eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              calendarStyle: CalendarStyle(
                tablePadding: EdgeInsets.all(8),
                markerSize: 2,
                defaultTextStyle: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                weekendTextStyle: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                selectedTextStyle: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                todayDecoration:
                    BoxDecoration(color: Colors.grey.withOpacity(0.5), shape: BoxShape.circle),
                selectedDecoration:
                    BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
                markerDecoration:
                    BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
                outsideDaysVisible: false,
              ),
              onDaySelected: _onDaySelected,
              onRangeSelected: _onRangeSelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            "Tasks",
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 15.0),
          Expanded(
            
                child: ListView.builder(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      color: Colors.grey[200],
                                      size: 18,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                       tasksList[i].startTime == null ?'':'${ tasksList[i].startTime} - ${tasksList[i].endTime}',
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[100]),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                       tasksList[i].date== null?'': tasksList[i].date!,
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
                                        fontSize: 15, color: Colors.grey[100]),
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
                               tasksList[i].status! == ProjectStatus.todo.name ? 'To Do':tasksList[i].status! == ProjectStatus.inProgress.name ? 'In Progress': 'Completed',
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
                            quarterTurns: 3,
                            child: GestureDetector(
                              onTap: (){
                                showActionsBottomSheet(context, tasksList[i], i);
                              },
                              child: Icon(FontAwesomeIcons.ellipsis, color: kWhiteColor,)
                            ),
                          ),
                       
                        ]),
                      ),
                    );
                  },
                )
             
          ),
        ],
      ),
    );
  }

  builSpeedDial() {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      animatedIconTheme: IconThemeData(size: 28.0),
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: Icon(Icons.work_history, color: Colors.white),
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          onTap: () async {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => AddProjectScreen())));
          },
          label: 'Add Project',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: kPrimaryColor,
        ),
        SpeedDialChild(
          child: Icon(Icons.check_circle_outline, color: Colors.white),
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          onTap: () async {
            showAddTaskDialog();
            //context.pushNamed('addCompanyDetails');
          },
          label: 'Add Task',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: kPrimaryColor,
        ),
        SpeedDialChild(
          child: Icon(Icons.note, color: Colors.white),
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          onTap: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddTodoScreen();
    }));
          },
          label: 'Add Notes',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: kPrimaryColor,
        ),
      ],
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
                        child: Column(
                      children: [
                         Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10),
                  child: textFormFields(context: context, controller: taskNameController, hintText: 'e.g Define project scope', labelText:'Task Name')),
                Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child:textFormFields(context: context, controller: taskDescController,hintText: 'Describe your task.', labelText:'Description', maxLines: 5) ),
                     
                Padding(
                  padding: const EdgeInsets.only(
                     top: 10, bottom: 10),
                  child: textFormFields(context: context, controller: dateController,labelText: 'Date', suffixIcon:  GestureDetector(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: Icon(
                                      Icons.calendar_month_outlined,
                                      color: kPrimaryColor,
                                    ),
                                  ),) ),
                                  
                Container(
                  padding:
                      EdgeInsets.only( top: 10, bottom: 10),
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
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.33,
                              child: textFormFields(context: context,controller: startTimeController, labelText: 'Start Time', suffixIcon: GestureDetector(
                                    onTap: () {
                                      _selectTime(context, "StartTime");
                                    },
                                    child: Icon(
                                      Icons.alarm,
                                      color: kPrimaryColor,
                                    ),
                                  ),) ),
                                  SizedBox(width: 5,),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.33,
                              child: textFormFields(context: context,controller: endTimeController, labelText: 'End Time', suffixIcon: GestureDetector(
                                    onTap: () {
                                      _selectTime(context, "EndTimeTime");
                                    },
                                    child: Icon(
                                      Icons.alarm,
                                      color: kPrimaryColor,
                                    ),
                                  ),) ),],
                        ),
                      ),
                      
                      Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
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
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                for (var i in projects)
                                GestureDetector(
                                  onTap: () {
                                    this.setState(() {
      this.project = project;
    });
                                    this._SetCategory(i['projectName']);

                                  },
                                  child: Projectcard(
                                    projectText: i['projectName'],
                                    isActive: this.project == i['projectName'],
                                  ),
                                ),
                                 ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: (){
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
  
    Widget textFormFields({controller, hintText,labelText, onChanged, textInputType, icon, BuildContext? context, Widget? suffixIcon, maxLines}) {
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
        style: FlutterFlowTheme.of(context!).bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
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
                        hintStyle: FlutterFlowTheme.of(context).bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
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
        projectId: ''
			);
			try {
				await _insertTask(taskObj);
			} catch (e) {

			} finally {
				Navigator.push(context, MaterialPageRoute(builder: ((context) => CalendarScheduleScreen())));
				return;
			}
  }
  	Future<void> _insertTask(TaskModel task) async {
	  TaskDatabaseHelper taskDb = TaskDatabaseHelper();
	  await taskDb.initDatabase();
	  int result = await taskDb.insertTask(task);
	  //await projectsDb.closeDatabase();
	}

  Future<dynamic> showActionsBottomSheet(
      BuildContext context, TaskModel data, int index) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 330,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select Status",
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                  Container(
                    height: 300,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      children: [
                        
                        GestureDetector(
                          onTap: () {
                            data.status = ProjectStatus.todo.name;
                            showAlertDialog(data, 'To Do');
                          },
                          child: ActionsButtonWidget(
                              text: "To Do",
                              icon: FontAwesomeIcons.paypal,
                              textColor: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                             data.status = ProjectStatus.inProgress.name;
                            showAlertDialog(data, 'In Progress');
                          },
                          child: ActionsButtonWidget(
                            text: "In Progress",
                            textColor: Colors.white,
                            icon: FontAwesomeIcons.moneyBill,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                             data.status = ProjectStatus.completed.name;
                            showAlertDialog(data, 'Completed');
                          },
                          child: ActionsButtonWidget(
                            text: "Completed",
                            textColor: Colors.white,
                            icon: FontAwesomeIcons.personCircleCheck,
                          ),
                        ),
                       ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
     showAlertDialog(TaskModel data, String txt){
    return showDialog(context: context, builder: (_) =>
       AlertDialog(
        // title: const Text("Info"),
        content: Text('Do you want to change status to $txt'),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              updateInvoice(data);
            },
          )
        ],
      ));
  }

   Future updateInvoice(TaskModel task) async {
    final taskData = task;

    await TaskDatabaseHelper().updateTask(taskData);
          Navigator.push(context, MaterialPageRoute(builder: ((context) => CalendarScheduleScreen(index: 0,))));

 
  }

}
