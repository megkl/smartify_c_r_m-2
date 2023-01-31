import 'package:flutter/material.dart';

class EventInfo {
   int? id;
   String name;
   String description;
   String location;
   String link;
   dynamic attendeeEmails;
   dynamic shouldNotifyAttendees;
   dynamic hasConfereningSupport;
   String startTimeInEpoch;
   String endTimeInEpoch;
   String? date;

  EventInfo({
    this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.link,
     this.attendeeEmails,
     this.shouldNotifyAttendees,
     this.hasConfereningSupport,
    required this.startTimeInEpoch,
    required this.endTimeInEpoch,
    this.date
  });

  EventInfo.fromMap(Map snapshot)
      : id = snapshot['id'] ?? '',
        name = snapshot['name'] ?? '',
        description = snapshot['desc'],
        location = snapshot['loc'],
        link = snapshot['link'],
        date = snapshot['date'],
        attendeeEmails = snapshot['emails'] ?? '',
        shouldNotifyAttendees = snapshot['should_notify'],
        hasConfereningSupport = snapshot['has_conferencing'],
        startTimeInEpoch = snapshot['start'],
        endTimeInEpoch = snapshot['end'];

  toMap() {
    return {
      'id': id,
      'name': name,
      'desc': description,
      'loc': location,
      'link': link,
      'date': date,
      'emails': attendeeEmails,
      'should_notify': shouldNotifyAttendees,
      'has_conferencing': hasConfereningSupport,
      'start': startTimeInEpoch,
      'end': endTimeInEpoch,
    };
  }
}
