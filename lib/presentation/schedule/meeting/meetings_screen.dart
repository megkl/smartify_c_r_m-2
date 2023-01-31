import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartify_c_r_m/database/meet_database_helper.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:smartify_c_r_m/presentation/schedule/meeting/add_meeting_screen.dart';
import 'package:smartify_c_r_m/presentation/schedule/meeting/edit_delete_screen.dart';

import '../../../backend/firebase_storage/calendar_api.dart';
import '../../../flutter_flow/flutter_flow_util.dart';
import '../../../model/event_info_model.dart';

class CalendarScheduleScreen extends StatefulWidget {
  const CalendarScheduleScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScheduleScreen> createState() => _CalendarScheduleScreenState();
} 

class _CalendarScheduleScreenState extends State<CalendarScheduleScreen> {
  Storage? storage = Storage();
  final db = MeetingsDatabaseHelper();

  @override
  Widget build(BuildContext context) {
     var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text(
          'Event Details',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddMeetingScreen(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: 
        Container(
          padding: EdgeInsets.only(top: 8.0),
          color: Colors.white,
          child: FutureBuilder(
                                                future: db.getAllMeetings(),
                                                initialData: const [],
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<List>
                                                        snapshot) {
                                                  var data = snapshot
                                                      .data;
                                                      print(data);
                                                       {
                 return 
                 data!.isNotEmpty? 
                 ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> eventInfo = data[index];

                      EventInfo event = EventInfo.fromMap(eventInfo);

                      // DateTime startTime = DateTime.fromMillisecondsSinceEpoch(int.parse(event.startTimeInEpoch));
                      // DateTime endTime = DateTime.fromMillisecondsSinceEpoch(int.parse(event.endTimeInEpoch));

                      String startTimeString = event.startTimeInEpoch;
                      String endTimeString = event.endTimeInEpoch;
                      String dateString = event.date!;

                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditDeleteMeetingScreen(event: event),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  bottom: 16.0,
                                  top: 16.0,
                                  left: 16.0,
                                  right: 16.0,
                                ),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event.name,
                                      style:FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      event.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          )
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                      child: Text(
                                        event.link,
                                        style: TextStyle(
                                          color: Colors.blue.withOpacity(0.5),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 5,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dateString,
                                              style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: kPrimaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          )
                                            ),
                                            SizedBox(height: 10,),
                                            Text(
                                              '$startTimeString - $endTimeString',
                                              style:  FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: kPrimaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          )
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ):Center(child: Text('No events found'),);
                 
                }
              
            },
          ),
        ),
      ),
    );
  }
}