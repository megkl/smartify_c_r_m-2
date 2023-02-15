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
        this.isDone,
        this.status,
    });
    int? id;
    String? taskName;
    String? taskDescription;
    String? userId;
    String? status;
    int? isDone;
    DateTime? from;
  DateTime? to;
  Color? background;

    factory TaskModel.fromMap(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        taskName: json["taskName"],
        taskDescription: json["taskDescription"],
        userId: json["userId"],
        isDone: json["isDone"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "taskName": taskName,
        "taskDescription": taskDescription,
        "isDone": isDone,
    };
     static List<TaskModel> todoList() {
    return [
      TaskModel(id: 1, taskName: 'Morning Excercise', isDone: 0 ),
      TaskModel(id: 2, taskName: 'Buy Groceries', isDone: 1 ),
      TaskModel(id: 3, taskName: 'Check Emails', ),
      TaskModel(id: 4, taskName: 'Team Meeting', ),
      TaskModel(id: 5, taskName: 'Work on mobile apps for 2 hour', ),
      TaskModel(id: 6, taskName: 'Dinner with Jenny', ),
    ];
  }
}
