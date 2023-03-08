import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_offical_apk/model/getClassesList_model.dart';
import 'package:dujo_offical_apk/teacher_section/attendence_section/attendence-Book/attendence_status.dart';
import 'package:dujo_offical_apk/teacher_section/attendence_section/take_attentence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AttendenceBookScreen extends StatelessWidget {
  var schoolId;
  AttendenceBookScreen({required this.schoolId, super.key});

  @override
  Widget build(BuildContext context) {
    log(schoolId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendence Book'),
      ),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(schoolId)
            .collection("Classes")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final data = AddClassesModel.fromJson(
                      snapshot.data!.docs[index].data());
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AttendenceDetailsScreen(
                            schoolId: schoolId,
                            classID: data.classID,
                          );
                        },
                      ));
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: 60,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          data.className,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: snapshot.data!.docs.length);
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      )),
    );
  }
}
