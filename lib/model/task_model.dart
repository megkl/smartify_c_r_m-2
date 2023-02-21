// To parse this JSON data, do
//
//     final TaskModel = TaskModelFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class TaskModel {
    TaskModel({
        this.id,
        this.taskName,
        this.taskDescription,
        this.userId,
        this.projectId,
        this.status,
        this.startTime,
        this.endTime,
        this.date,
        this.color
    });
    int? id;
    String? taskName;
    String? taskDescription;
    String? userId;
    String? projectId;
    String? status;
    String? startTime;
  String? endTime;
  String? date;
  String? color;

    factory TaskModel.fromMap(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        taskName: json["taskName"],
        taskDescription: json["taskDescription"],
        userId: json["userId"],
        projectId: json["projectId"],
        status: json["status"],
        startTime: json["startTime"],
        endTime: json["startTime"],
        date: json["date"],
        color: json["color"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "taskName": taskName,
        "taskDescription": taskDescription,
        "endTime": endTime,
        "startTime": startTime,
        "color": color,
        "status": status,
        "projectId": projectId,
        "date": date,
    };
  //    static List<TaskModel> endTimedoList() {
  //   return [
  //     TaskModel(id: 1, taskName: 'Morning Excercise'),
  //     TaskModel(id: 2, taskName: 'Buy Groceries'),
  //     TaskModel(id: 3, taskName: 'Check Emails', ),
  //     TaskModel(id: 4, taskName: 'Team Meeting', ),
  //     TaskModel(id: 5, taskName: 'Work on mobile apps for 2 hour', ),
  //     TaskModel(id: 6, taskName: 'Dinner with Jenny', ),
  //   ];
  // }

  
}

enum ProjectStatus {
    todo,
    inProgress,
    completed
  }
