//     final GetAttendenceModel = GetAttendenceModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

GetAttendenceModel GetAttendenceModelFromJson(String str) =>
    GetAttendenceModel.fromJson(json.decode(str));

String GetAttendenceModelToJson(GetAttendenceModel data) =>
    json.encode(data.toJson());

class GetAttendenceModel {
  GetAttendenceModel({
    required this.id,
    required this.studentClass,
    required this.bloodGroup,
    required this.rollNo,
    required this.gurdianName,
    required this.address,
    required this.gender,
    required this.studentImage,
  });

  String id;
  bool studentClass = true;
  String bloodGroup;
  String rollNo;
  String gurdianName;
  String address;
  String gender;
  String studentImage;

  factory GetAttendenceModel.fromJson(Map<String, dynamic> json) =>
      GetAttendenceModel(
        id: json["id"] ?? '',
        gender: json["gender"] ?? '',
        studentClass: json["studentClass"] ?? true,
        bloodGroup: json["bloodGroup"] ?? '',
        rollNo: json["rollNo"] ?? '',
        gurdianName: json["gurdianName"] ?? '',
        address: json["address"] ?? '',
        studentImage: json["studentImage"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bloodGroup": bloodGroup,
        "studentClass": studentClass,
        "studentImage": studentImage,
        "rollNo": rollNo,
        "gurdianName": gurdianName,
        "address": gender,
      };
}

class AddAttendenceStatusToFireBase {
  Future addAttendenceStatusController(GetAttendenceModel productModel, context,
      schoolid, classId, formatter, studentName, studentemail) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(schoolid)
          .collection("Classes")
          .doc(classId)
          .collection("Students")
          .doc(studentemail)
          .set(productModel.toJson());
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
