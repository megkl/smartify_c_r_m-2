// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

class CompanyModel {
    CompanyModel({
        this.id,
        this.companyName,
        this.contactName,
        this.photoUrl,
        this.companyEmail,
        this.companyPhoneNumber,
        this.country,
        this.companyAddress,
        this.companyLocation,
        this.companyWebsite,
        this.paypal,
        this.userId
    });
    int? id;
    String? companyName;
    String? contactName;
    String? photoUrl;
    String? companyEmail;
    String? companyPhoneNumber;
    String? country;
    String? companyAddress;
    String? companyLocation;
    String? companyWebsite;
    String? paypal;
    String? userId;

    factory CompanyModel.fromMap(Map<String, dynamic> json) => CompanyModel(
        id: json["id"],
        companyName: json["companyName"],
        contactName: json["contactName"],
        photoUrl: json["photoUrl"],
        companyEmail: json["companyEmailNumber"],
        companyPhoneNumber: json["companyPhoneNumber"],
        country: json["country"],
        companyAddress: json["companyAddress"],
        companyLocation: json["companyLocation"],
        companyWebsite: json["companyWebsite"],
        paypal: json["paypal"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "companyName": companyName,
        "contactName": contactName,
        "photoUrl": photoUrl,
        "companyEmail": companyEmail,
        "companyPhoneNumber": companyPhoneNumber,
        "country": country,
        "companyAddress": companyAddress,
        "companyLocation": companyLocation,
        "companyWebsite": companyWebsite,
        "paypal": paypal,
    };
}
