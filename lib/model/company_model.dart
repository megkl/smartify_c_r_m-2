// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

CompanyModel companyModelFromJson(String str) => CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
    CompanyModel({
        this.companyName,
        this.contactName,
        this.photoUrl,
        this.companyEmailNumber,
        this.companyPhoneNumber,
        this.country,
        this.companyAddress,
        this.companyLocation,
        this.companyWebsite,
    });

    String? companyName;
    String? contactName;
    Uint8List? photoUrl;
    String? companyEmailNumber;
    String? companyPhoneNumber;
    String? country;
    String? companyAddress;
    String? companyLocation;
    String? companyWebsite;

    factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        companyName: json["companyName"],
        contactName: json["contactName"],
        photoUrl: json["photoUrl"],
        companyEmailNumber: json["companyEmailNumber"],
        companyPhoneNumber: json["companyPhoneNumber"],
        country: json["country"],
        companyAddress: json["companyAddress"],
        companyLocation: json["companyLocation"],
        companyWebsite: json["companyWebsite"],
    );

    Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "contactName": contactName,
        "photoUrl": photoUrl,
        "companyEmailNumber": companyEmailNumber,
        "companyPhoneNumber": companyPhoneNumber,
        "country": country,
        "companyAddress": companyAddress,
        "companyLocation": companyLocation,
        "companyWebsite": companyWebsite,
    };
}
