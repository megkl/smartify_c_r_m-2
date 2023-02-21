// To parse this JSON data, do
//
//     final ProjectModel = ProjectModelFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

class ProjectModel {
    ProjectModel({
        this.id,
        this.projectName,
        this.projectDescription,
        this.userId,
        this.status
    });
    int? id;
    String? projectName;
    String? projectDescription;
    String? userId;
    String? status;

    factory ProjectModel.fromMap(Map<String, dynamic> json) => ProjectModel(
        id: json["id"],
        projectName: json["projectName"],
        projectDescription: json["projectDescription"],
        userId: json["userId"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "projectName": projectName,
        "projectDescription": projectDescription,
        "status": status,
    };
    
}
