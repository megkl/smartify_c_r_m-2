import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:smartify_c_r_m/database/meet_database_helper.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:smartify_c_r_m/presentation/schedule/calendar_view_screen.dart';
import 'package:smartify_c_r_m/presentation/schedule/meeting/add_meeting_screen.dart';
import 'package:smartify_c_r_m/presentation/schedule/meeting/edit_delete_screen.dart';
import 'package:smartify_c_r_m/presentation/schedule/project/projects_screen.dart';

import '../../backend/firebase_storage/calendar_api.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../model/event_info_model.dart';
import 'task/tasks_list_screen.dart';

class CalendarScheduleScreen extends StatefulWidget {
  const CalendarScheduleScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScheduleScreen> createState() => _CalendarScheduleScreenState();
} 

class _CalendarScheduleScreenState extends State<CalendarScheduleScreen> {
  Storage? storage = Storage();
  final db = MeetingsDatabaseHelper();
  int _selectedIndex = 0;
  void _onIndexChange(int index) {
    setState(() {
      this._selectedIndex = index;
    });
  }
  final List<Widget> _Pages = [
    CalendarViewScreen(),
    ProjectsScreen(),
    TasksScreen(),
    TasksScreen()
    // ProjectsPage(),
    // TasksPage(
    //   Goback: (int index) {
    //     print(index);
    //   },
    // )
  ];

  @override
  Widget build(BuildContext context) {
     var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;
    return Scaffold(
            backgroundColor: Colors.white70,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey.shade400,
        currentIndex: this._selectedIndex,
        onTap: this._onIndexChange,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded), label: "Schedule"),
           BottomNavigationBarItem(
              icon: Icon(Icons.work_history),
              label: "Projects"),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline), label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: "Notes"),
        ],
      ),
    body: this._Pages.elementAt(this._selectedIndex),
    );
  }
 
}