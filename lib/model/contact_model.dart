import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:quiver/core.dart';
// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

//ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

//String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
    ContactModel({
        this.id,
        this.fullName,
        this.jobTitle,
        this.companyName,
        this.phoneNumbers,
        this.emails,
        this.locationDetails,
        this.website,
        this.contactGroup,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.otherInfo,
    });

    int? id;
    String? fullName;
    String? jobTitle;
    String? companyName;
    String? phoneNumbers;
    String? emails;
    PostalAddress? locationDetails;
    String? website;
    String? contactGroup;
    String? userId;
    String? createdAt;
    String? updatedAt;
    String? otherInfo;

    factory ContactModel.fromMap(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        fullName: json["fullName"],
        jobTitle: json["jobTitle"],
        companyName: json["companyName"],
        phoneNumbers: json["phoneNumbers"],
        emails: json["emails"],
        locationDetails: PostalAddress.fromMap(json["locationDetails"]),
        website: json["website"],
        contactGroup: json["contactGroup"],
        userId: json["userId"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        otherInfo: json["otherInfo"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fullName": fullName,
        "jobTitle": jobTitle,
        "companyName": companyName,
        "phoneNumbers": phoneNumbers,
        "emails": emails,
        "locationDetails": locationDetails == null ? null:locationDetails!.toMap(),
        "website": website,
        "contactGroup": contactGroup,
        "userId": userId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "otherInfo": otherInfo,
    };
}

class PostalAddress {
  PostalAddress(
      {this.label,
      this.street,
      this.city,
      this.postcode,
      this.region,
      this.country});
  String? label, street, city, postcode, region, country;

  PostalAddress.fromMap(Map m) {
    label = m["label"];
    street = m["street"];
    city = m["city"];
    postcode = m["postcode"];
    region = m["region"];
    country = m["country"];
  }

Map<String, dynamic> toMap() => {
        "label": label,
        "street": street,
        "city": city,
        "postcode": postcode,
        "region": region,
        "country": country
      };

  @override
  String toString() {
    String finalString = "";
    if (this.street != null) {
      finalString += this.street!;
    }
    if (this.city != null) {
      if (finalString.isNotEmpty) {
        finalString += ", " + this.city!;
      } else {
        finalString += this.city!;
      }
    }
    if (this.region != null) {
      if (finalString.isNotEmpty) {
        finalString += ", " + this.region!;
      } else {
        finalString += this.region!;
      }
    }
    if (this.postcode != null) {
      if (finalString.isNotEmpty) {
        finalString += " " + this.postcode!;
      } else {
        finalString += this.postcode!;
      }
    }
    if (this.country != null) {
      if (finalString.isNotEmpty) {
        finalString += ", " + this.country!;
      } else {
        finalString += this.country!;
      }
    }
    return finalString;
  }
}

/// Item class used for contact fields which only have a [label] and
/// a [value], such as emails and phone numbers
class Item {
  Item({this.label, this.value});

  String? label, value;

  Item.fromMap(Map m) {
    label = m["label"];
    value = m["value"];
  }

  @override
  bool operator ==(Object other) {
    return other is Item &&
        this.label == other.label &&
        this.value == other.value;
  }

  @override
  int get hashCode => hash2(label ?? "", value ?? "");

  static Map _toMap(Item i) => {"label": i.label, "value": i.value};
}

enum AndroidAccountType { facebook, google, whatsapp, other }
