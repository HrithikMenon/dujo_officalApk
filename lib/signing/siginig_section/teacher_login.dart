import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_offical_apk/school/school_teacher_home.dart';
import 'package:dujo_offical_apk/signing/dujo_sign_up/teacher_dujoSiginUp.dart';
import 'package:dujo_offical_apk/signing/siginig_section/student_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/teacher_home/teacher_home_screen.dart';
import '../../widget/button_container.dart';

class TeacherLoginSection extends StatefulWidget {
  var schoolId;
  var classID;

  TeacherLoginSection({
    this.schoolId,
    required this.classID,
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  State<TeacherLoginSection> createState() => _TeacherLoginSectionState();
}

class _TeacherLoginSectionState extends State<TeacherLoginSection> {
  TextEditingController teacheridController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("enter teacher section");
    return SizedBox(
      height: 300,
      width: double.infinity,
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
            
              },
              child: Container(
                color: Colors.white.withOpacity(0.2),
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Teachers",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
               gotoClassTeacherScreen(context);
              },
              child: Container(
              color: Colors.white.withOpacity(0.2),
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Class Teachers",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
    );
  }
  gotoClassTeacherScreen(BuildContext context){
  return showBottomSheet(context: context, builder: (context) {
    return Container(
      color: Colors.transparent,
      
      height: 400,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(widget.screenSize.width * 1 / 13),
            child: Container(
              height: widget.screenSize.width * 0.13,
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                  controller: teacheridController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your Email',
                      prefixIcon: Icon(Icons.mail_lock_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      )),
                  style: TextStyle(fontSize: 20,color: Colors.black)),
            ),
          ),
          SizedBox(
            height: widget.screenSize.width * 1 / 50,
          ),
          Padding(
            padding: EdgeInsets.only(
                // top: screenSize.width * 1 / 36,
                left: widget.screenSize.width * 1 / 12,
                right: widget.screenSize.width * 1 / 13),
            child: Container(
              height: widget.screenSize.width * 0.13,
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
                style: TextStyle(fontSize: 19,color: Colors.black),
                obscureText: true,
              ),
            ),
          ),
          SizedBox(
            height: widget.screenSize.width * 1 / 23,
          ),
          InkWell(
            child: Padding(
              padding: EdgeInsets.only(left: widget.screenSize.width * 1 / 1.9),
              child: Text(
                "Forgot Password ?",
                style: TextStyle(color: Colors.black),
              ),
            ),
            onTap: () {

            },
          ),
          SizedBox(height: widget.screenSize.width * 1 / 36),
          Container(
            height: widget.screenSize.width * 1 / 7,
            width: widget.screenSize.width * 1 / 1.2,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(14)),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsets.all(9.0),
                textStyle: const TextStyle(fontSize: 17),
              ),
              onPressed: () async {
                // >>>>>>>>>>>>>>>>>Checking ID<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: teacheridController.text.trim(),
                          password: passwordController.text.trim())
                      .then(
                        (value) => Get.to(
                        TeacherHomeScreen(classID:widget.classID ,schoolId:widget.schoolId ,teacherEmail:teacheridController.text.trim() ),
                        ),
                      );
       
                } catch (e) {
                  errorBox(context, e);
                }
              },
              child: const Text('SIGN IN'),
            ),
          ),
          SizedBox(height: widget.screenSize.width * 1 / 100),
          Padding(
            padding: EdgeInsets.only(
                left: widget.screenSize.width * 1 / 4.3,
                top: widget.screenSize.width * 1 / 29),
            child: Row(children: [
              Text(
                "Don't have an account ? ",
                style: TextStyle(color: Colors.black,),
              ),
              InkWell(
                child: Container(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 19, color: Colors.red),
                  ),
                ),
                onTap: () async {
                  Get.to(TeacherDujoSignup(schoolID: widget.schoolId));
                  //
                },
              ),
            ]),
          ),
        ],
),
);
  },);

}
}

gotoTeacherScreen(BuildContext context){

}