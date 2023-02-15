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
        this.userId
    });
    int? id;
    String? projectName;
    String? projectDescription;
    String? userId;

    factory ProjectModel.fromMap(Map<String, dynamic> json) => ProjectModel(
        id: json["id"],
        projectName: json["projectName"],
        projectDescription: json["projectDescription"],
        userId: json["userId"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "projectName": projectName,
        "projectDescription": projectDescription,
    };
    
}
