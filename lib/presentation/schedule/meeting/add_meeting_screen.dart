import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:intl/intl.dart';
import 'package:smartify_c_r_m/database/meet_database_helper.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../backend/calendar_client.dart';
import '../../../backend/firebase_storage/calendar_api.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../model/event_info_model.dart';


class AddMeetingScreen extends StatefulWidget {
  const AddMeetingScreen({Key? key}) : super(key: key);

  @override
  State<AddMeetingScreen> createState() => _AddMeetingScreenState();
}

class _AddMeetingScreenState extends State<AddMeetingScreen> {
  Storage storage = Storage();
  CalendarClient calendarClient = CalendarClient();

  TextEditingController? textControllerDate = TextEditingController();
  TextEditingController? textControllerStartTime = TextEditingController();
  TextEditingController? textControllerEndTime = TextEditingController();
  TextEditingController? textControllerTitle = TextEditingController();
  TextEditingController? textControllerDesc = TextEditingController();
  TextEditingController? textControllerLocation = TextEditingController();
  TextEditingController? textControllerAttendee = TextEditingController();

  FocusNode? textFocusNodeTitle;
  FocusNode? textFocusNodeDesc;
  FocusNode? textFocusNodeLocation;
  FocusNode? textFocusNodeAttendee;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  String? currentTitle;
  String? currentDesc;
  String? currentLocation;
  String? currentEmail;
  String? errorString = '';
  // List<String> attendeeEmails = [];
  List<calendar.EventAttendee> attendeeEmails = [];

  bool isEditingDate = false;
  bool isEditingStartTime = false;
  bool isEditingEndTime = false;
  bool isEditingBatch = false;
  bool isEditingTitle = false;
  bool isEditingEmail = false;
  bool isEditingLink = false;
  bool isErrorTime = false;
  bool shouldNofityAttendees = false;
  bool hasConferenceSupport = false;

  bool isDataStorageInProgress = false;

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        textControllerDate!.text = DateFormat.yMMMMd().format(selectedDate);
      });
    }
  }

  _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime,
    );
    if (picked != null && picked != selectedStartTime) {
      setState(() {
        selectedStartTime = picked;
        textControllerStartTime!.text = selectedStartTime.format(context);
      });
    } else {
      setState(() {
        textControllerStartTime!.text = selectedStartTime.format(context);
      });
    }
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime,
    );
    if (picked != null && picked != selectedEndTime) {
      setState(() {
        selectedEndTime = picked;
        textControllerEndTime!.text = selectedEndTime.format(context);
      });
    } else {
      setState(() {
        textControllerEndTime!.text = selectedEndTime.format(context);
      });
    }
  }

  String? _validateTitle(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return 'Title can\'t be empty';
      }
    } else {
      return 'Title can\'t be empty';
    }

    return null;
  }

  String? _validateEmail(String? value) {
    if (value != null) {
      value = value.trim();

      if (value.isEmpty) {
        return 'Can\'t add an empty email';
      } else {
        final regex = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
        final matches = regex.allMatches(value);
        for (Match match in matches) {
          if (match.start == 0 && match.end == value.length) {
            return null;
          }
        }
      }
    } else {
      return 'Can\'t add an empty email';
    }

    return 'Invalid email';
  }

  @override
  void initState() {
    textControllerDate = TextEditingController();
    textControllerStartTime = TextEditingController();
    textControllerEndTime = TextEditingController();
    textControllerTitle = TextEditingController();
    textControllerDesc = TextEditingController();
    textControllerLocation = TextEditingController();
    textControllerAttendee = TextEditingController();

    textFocusNodeTitle = FocusNode();
    textFocusNodeDesc = FocusNode();
    textFocusNodeLocation = FocusNode();
    textFocusNodeAttendee = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text(
          'Create Event',
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Text(
                        'This will add a new event to the events list. You can also add video conferencing option and choose to notify the attendees of this event.',
                        style: FlutterFlowTheme.of(context).subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w300,
                                                      )
                      ),
                    ),
                    // Text(
                    //   'You will have access to modify or remove the event afterwards.',
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //     fontFamily: 'Raleway',
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.bold,
                    //     letterSpacing: 0.5,
                    //   ),
                    // ),
                    SizedBox(height: 16.0),
                    RichText(
                      text: TextSpan(
                        text: 'Select Date',
                        style: FlutterFlowTheme.of(context).title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      cursorColor: kPrimaryColor,
                      controller: textControllerDate,
                      textCapitalization: TextCapitalization.characters,
                      onTap: () => _selectDate(context),
                      readOnly: true,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      decoration: new InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.redAccent, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 16,
                          right: 16,
                        ),
                        hintText: 'eg: September 10, 2020',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                        errorText: isEditingDate && textControllerDate!.text != null
                            ? textControllerDate!.text.isNotEmpty
                                ? null
                                : 'Date can\'t be empty'
                            : null,
                        errorStyle:FlutterFlowTheme.of(context).title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.red,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w300,
                                                      )
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Start Time',
                        style: FlutterFlowTheme.of(context).title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      cursorColor: kPrimaryColor,
                      controller: textControllerStartTime,
                      onTap: () => _selectStartTime(context),
                      readOnly: true,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      decoration: new InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.redAccent, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 16,
                          right: 16,
                        ),
                        hintText: 'eg: 09:30 AM',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                        errorText: isEditingStartTime && textControllerStartTime!.text != null
                            ? textControllerStartTime!.text.isNotEmpty
                                ? null
                                : 'Start time can\'t be empty'
                            : null,
                        errorStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'End Time',
                        style: FlutterFlowTheme.of(context).title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      cursorColor: kPrimaryColor,
                      controller: textControllerEndTime,
                      onTap: () => _selectEndTime(context),
                      readOnly: true,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      decoration: new InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.redAccent, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 16,
                          right: 16,
                        ),
                        hintText: 'eg: 11:30 AM',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                        errorText: isEditingEndTime && textControllerEndTime!.text != null
                            ? textControllerEndTime!.text.isNotEmpty
                                ? null
                                : 'End time can\'t be empty'
                            : null,
                        errorStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Title',
                        style: FlutterFlowTheme.of(context).title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      enabled: true,
                      cursorColor: kPrimaryColor,
                      focusNode: textFocusNodeTitle,
                      controller: textControllerTitle,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          isEditingTitle = true;
                          currentTitle = value;
                        });
                      },
                      onSubmitted: (value) {
                        textFocusNodeTitle!.unfocus();
                        FocusScope.of(context).requestFocus(textFocusNodeDesc);
                      },
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      decoration: new InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.redAccent, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 16,
                          right: 16,
                        ),
                        hintText: 'eg: Birthday party of John',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                        errorText: isEditingTitle ? _validateTitle(currentTitle) : null,
                        errorStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Description',
                        style: FlutterFlowTheme.of(context).title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      enabled: true,
                      maxLines: null,
                      cursorColor: kPrimaryColor,
                      focusNode: textFocusNodeDesc,
                      controller: textControllerDesc,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          currentDesc = value;
                        });
                      },
                      onSubmitted: (value) {
                        textFocusNodeDesc!.unfocus();
                        FocusScope.of(context).requestFocus(textFocusNodeLocation);
                      },
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      decoration: new InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.redAccent, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 16,
                          right: 16,
                        ),
                        hintText: 'eg: Some information about this event',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Location',
                        style: FlutterFlowTheme.of(context).title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      enabled: true,
                      cursorColor: kPrimaryColor,
                      focusNode: textFocusNodeLocation,
                      controller: textControllerLocation,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          currentLocation = value;
                        });
                      },
                      onSubmitted: (value) {
                        textFocusNodeLocation!.unfocus();
                        FocusScope.of(context).requestFocus(textFocusNodeAttendee);
                      },
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      decoration: new InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.redAccent, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 16,
                          right: 16,
                        ),
                        hintText: 'Place of the event',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Attendees',
                        style: FlutterFlowTheme.of(context).title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: PageScrollPhysics(),
                      itemCount: attendeeEmails.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                attendeeEmails[index].email!,
                                style: FlutterFlowTheme.of(context).bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                              ),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    attendeeEmails.removeAt(index);
                                  });
                                },
                                color: Colors.red,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            enabled: true,
                            cursorColor: kPrimaryColor,
                            focusNode: textFocusNodeAttendee,
                            controller: textControllerAttendee,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.done,
                            onChanged: (value) {
                              setState(() {
                                currentEmail = value;
                              });
                            },
                            onSubmitted: (value) {
                              textFocusNodeAttendee!.unfocus();
                            },
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                            decoration: new InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.grey, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: kPrimaryColor, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: kPrimaryColor, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 16,
                                bottom: 16,
                                top: 16,
                                right: 16,
                              ),
                              hintText: 'Enter attendee email',
                              hintStyle: FlutterFlowTheme.of(context).bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                              errorText: isEditingEmail ? _validateEmail(currentEmail) : null,
                              errorStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.check_circle,
                            color: kPrimaryColor,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              isEditingEmail = true;
                            });
                            if (_validateEmail(currentEmail) == null) {
                              setState(() {
                                textFocusNodeAttendee!.unfocus();
                                calendar.EventAttendee eventAttendee = calendar.EventAttendee();
                                eventAttendee.email = currentEmail;

                                attendeeEmails.add(eventAttendee);

                                textControllerAttendee!.text = '';
                                currentEmail = null;
                                isEditingEmail = false;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    Visibility(
                      visible: attendeeEmails.isNotEmpty,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Notify attendees',
                                style: FlutterFlowTheme.of(context).title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                              ),
                              Switch(
                                value: shouldNofityAttendees,
                                onChanged: (value) {
                                  setState(() {
                                    shouldNofityAttendees = value;
                                  });
                                },
                                activeColor: kPrimaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add video conferencing',
                          style: FlutterFlowTheme.of(context).title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                        ),
                        Switch(
                          value: hasConferenceSupport,
                          onChanged: (value) {
                            setState(() {
                              hasConferenceSupport = value;
                            });
                          },
                          activeColor: kPrimaryColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                       Material(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: (){
                          addEveent();
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: 160,
                          height: 50,
                          alignment: Alignment.center,
                          child: "Save"
                              .text
                              .textStyle(
                                FlutterFlowTheme.of(context).title2.override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                              )
                              .make(),
                        ),
                      ),
                    ).centered(),
                  
                    // Container(
                    //   width: double.maxFinite,
                    //   child: RaisedButton(
                    //     elevation: 0,
                    //     focusElevation: 0,
                    //     highlightElevation: 0,
                    //     color: kPrimaryColor,
                    //     onPressed: isDataStorageInProgress
                    //         ? null
                    //         : () async {
                    //             setState(() {
                    //               isErrorTime = false;
                    //               isDataStorageInProgress = true;
                    //             });

                    //             textFocusNodeTitle!.unfocus();
                    //             textFocusNodeDesc!.unfocus();
                    //             textFocusNodeLocation!.unfocus();
                    //             textFocusNodeAttendee!.unfocus();

                    //             if (selectedDate != null &&
                    //                 selectedStartTime != null &&
                    //                 selectedEndTime != null &&
                    //                 currentTitle != null) {
                    //               int startTimeInEpoch = DateTime(
                    //                 selectedDate.year,
                    //                 selectedDate.month,
                    //                 selectedDate.day,
                    //                 selectedStartTime.hour,
                    //                 selectedStartTime.minute,
                    //               ).millisecondsSinceEpoch;

                    //               int endTimeInEpoch = DateTime(
                    //                 selectedDate.year,
                    //                 selectedDate.month,
                    //                 selectedDate.day,
                    //                 selectedEndTime.hour,
                    //                 selectedEndTime.minute,
                    //               ).millisecondsSinceEpoch;

                    //               print('DIFFERENCE: ${endTimeInEpoch - startTimeInEpoch}');

                    //               print('Start Time: ${DateTime.fromMillisecondsSinceEpoch(startTimeInEpoch)}');
                    //               print('End Time: ${DateTime.fromMillisecondsSinceEpoch(endTimeInEpoch)}');

                    //               if (endTimeInEpoch - startTimeInEpoch > 0) {
                    //                 if (_validateTitle(currentTitle) == null) {
                    //                   await calendarClient
                    //                       .insert(
                    //                           title: currentTitle!,
                    //                           description: currentDesc ?? '',
                    //                           location: currentLocation??'',
                    //                           attendeeEmailList: attendeeEmails,
                    //                           shouldNotifyAttendees: shouldNofityAttendees,
                    //                           hasConferenceSupport: hasConferenceSupport,
                    //                           startTime: DateTime.fromMillisecondsSinceEpoch(startTimeInEpoch),
                    //                           endTime: DateTime.fromMillisecondsSinceEpoch(endTimeInEpoch))
                    //                       .then((eventData) async {
                    //                     String eventId = eventData['id']!;
                    //                     String eventLink = eventData['link']!;

                    //                     List<String> emails = [];

                    //                     for (int i = 0; i < attendeeEmails.length; i++)
                    //                       emails.add(attendeeEmails[i].email!);

                    //                     EventInfo eventInfo = EventInfo(
                    //                       id: int.parse(eventId),
                    //                       name: currentTitle!,
                    //                       description: currentDesc ?? '',
                    //                       location: currentLocation!,
                    //                       link: eventLink,
                    //                       attendeeEmails: emails,
                    //                       shouldNotifyAttendees: shouldNofityAttendees,
                    //                       hasConfereningSupport: hasConferenceSupport,
                    //                       startTimeInEpoch: startTimeInEpoch,
                    //                       endTimeInEpoch: endTimeInEpoch,
                    //                     );

                    //                     await storage
                    //                         .storeEventData(eventInfo)
                    //                         .whenComplete(() => Navigator.of(context).pop())
                    //                         .catchError(
                    //                           (e) => print(e),
                    //                         );
                    //                   }).catchError(
                    //                     (e) => print(e),
                    //                   );

                    //                   setState(() {
                    //                     isDataStorageInProgress = false;
                    //                   });
                    //                 } else {
                    //                   setState(() {
                    //                     isEditingTitle = true;
                    //                     isEditingLink = true;
                    //                   });
                    //                 }
                    //               } else {
                    //                 setState(() {
                    //                   isErrorTime = true;
                    //                   errorString = 'Invalid time! Please use a proper start and end time';
                    //                 });
                    //               }
                    //             } else {
                    //               setState(() {
                    //                 isEditingDate = true;
                    //                 isEditingStartTime = true;
                    //                 isEditingEndTime = true;
                    //                 isEditingBatch = true;
                    //                 isEditingTitle = true;
                    //                 isEditingLink = true;
                    //               });
                    //             }
                    //             setState(() {
                    //               isDataStorageInProgress = false;
                    //             });
                    //           },
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    //       child: isDataStorageInProgress
                    //           ? SizedBox(
                    //               height: 28,
                    //               width: 28,
                    //               child: CircularProgressIndicator(
                    //                 strokeWidth: 2,
                    //                 valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    //               ),
                    //             )
                    //           : Text(
                    //               'ADD',
                    //               style: FlutterFlowTheme.of(context).title3
                    //                                   .override(
                    //                                     fontFamily: 'Outfit',
                    //                                     color: Colors.white,
                    //                                     fontSize: 14,
                    //                                     fontWeight: FontWeight.w500,
                    //                                   ),
                    //             ),
                    //     ),
                    //   ),
                    // ),
                    
                    Visibility(
                      visible: isErrorTime,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            errorString!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void addEveent() async {

      await addEvent();
      //final isUpdating = widget.note != null;

      // if (isUpdating) {
      //   await updateNote();
      // } else {
      //   await addNote();
      // }

 context.pushNamed(
                    'home');

    }
      Future addEvent() async {

    final event = EventInfo(
      name: textControllerTitle!.text,
      description: textControllerDesc!.text,
      startTimeInEpoch: textControllerStartTime!.text,
      endTimeInEpoch: textControllerEndTime!.text,
      link: '',
      date: textControllerDate!.text,
      location: textControllerLocation!.text,
      //attendeeEmails: [textControllerAttendee!.text]
     );

    await MeetingsDatabaseHelper().saveMeetings(event);
  }

  }


