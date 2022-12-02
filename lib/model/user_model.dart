// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:smartify_c_r_m/model/company_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.email,
        this.displayName,
        this.photoUrl,
        this.uid,
        this.phoneNumber,
        this.status,
        this.companyModel
    });

    String? email;
    String? displayName;
    String? photoUrl;
    String? uid;
    String? phoneNumber;
    String? status;
    CompanyModel? companyModel;
    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        displayName: json["displayName"],
        photoUrl: json["photoUrl"],
        uid: json["uid"],
        phoneNumber: json["phoneNumber"],
        status: json["status"],
        companyModel: json["company"] != null ?json["company"]: null,
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "displayName": displayName,
        "photoUrl": photoUrl,
        "uid": uid,
        "phoneNumber": phoneNumber,
        "status": status,
        "company": companyModel ?? {},
    };
}
