import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_offical_apk/school/school_student_home_new.dart';
import 'package:dujo_offical_apk/school/school_student_profile.dart';
import 'package:dujo_offical_apk/signing/dujo_sign_up/student_dujoSiginUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/student_home/Students_sections/homescreen/widgets/home_screen.dart';

class StudentLoginSection extends StatelessWidget {
  var schoolId;
  var classID;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  StudentLoginSection({
    super.key,
    required this.screenSize,
    required this.schoolId,
    this.classID,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    log(classID.toString());
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenSize.width * 1 / 13),
            child: Container(
              height: screenSize.width * 0.13,
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Email ID',
                      prefixIcon: Icon(Icons.mail_lock_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      )),
                  style: TextStyle(fontSize: 20)),
            ),
          ),
          SizedBox(
            height: screenSize.width * 1 / 50,
          ),
          Padding(
            padding: EdgeInsets.only(
                // top: screenSize.width * 1 / 36,
                left: screenSize.width * 1 / 12,
                right: screenSize.width * 1 / 13),
            child: Container(
              height: screenSize.width * 0.13,
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(19)),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: TextStyle(fontSize: 19),
                  hintText: 'Password',
                ),
                style: TextStyle(fontSize: 19),
                obscureText: true,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.width * 1 / 23,
          ),
          InkWell(
            child: Padding(
              padding: EdgeInsets.only(left: screenSize.width * 1 / 1.9),
              child: Text(
                "Forgot Password ?",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {},
          ),
          SizedBox(height: screenSize.width * 1 / 36),
          Container(
            height: screenSize.width * 1 / 7,
            width: screenSize.width * 1 / 1.2,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(14)),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsets.all(9.0),
                textStyle: const TextStyle(fontSize: 17),
              ),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()).then((value) => Get.to(StudentsHomeHomeScreen(
                            classID: classID,
                            schoolID:schoolId ,
                            studentEmailid:emailController.text.trim() ,

                          )));
                      // .then((value) => Get.to(SchoolStudentHomeNew(
                      //       schoolID: schoolId,
                      //       classID: classID,
                      //       studentEmailid: emailController.text.trim(),
                      //     )));
                } catch (e) {
                  errorBox(context, e);
                }
              },
              child: const Text('SIGN IN'),
            ),
          ),
          SizedBox(height: screenSize.width * 1 / 100),
          Padding(
            padding: EdgeInsets.only(
                left: screenSize.width * 1 / 4.3,
                top: screenSize.width * 1 / 29),
            child: Row(children: [
              Text(
                "Don't have an account ? ",
                style: TextStyle(color: Colors.white),
              ),
              InkWell(
                child: Container(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 19, color: Colors.yellowAccent),
                  ),
                ),
                onTap: () {
                  Get.to(StuentDujoSignup(
                    schoolID: schoolId,
                    classID: classID,
                  ));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //            DujoSignup(schoolID:schoolId ,classID: classID,)),
                  // );
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }


}
  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(e.toString()),
          );
        });
  }