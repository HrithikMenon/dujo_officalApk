import 'package:dujo_offical_apk/create_profile.dart';
import 'package:dujo_offical_apk/signing/Get_students/get_students_drop_downlist.dart';
import 'package:dujo_offical_apk/signing/dujosigning.dart';
import 'package:dujo_offical_apk/signing/phone_otp/newPhone_otp_screen.dart';
import 'package:dujo_offical_apk/signing/phone_otp/phone_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/get_schoolList/dropdown-schoolList.dart';
import 'Get_school/get_schooil_dropList.dart';

class DujoSignup extends StatelessWidget {
  var schoolID;
  var classID;

  DujoSignup({required this.schoolID, this.classID, super.key});

  final List<bool> _selectedSchools = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          // width: double.infinity,
          Container(
            width: screenSize.width * 0.8,
            margin: EdgeInsets.only(top: screenSize.width * 1 / 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(top: screenSize.width * 1 / 12),
                            width: screenSize.width / 3,
                            child: Divider(
                              color: Colors.red,
                              thickness: 3,
                            )),
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.width * 1 / 20),
                          child: Container(
                            height: screenSize.width * 1 / 7,
                            width: screenSize.width * 1 / 3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://storage.googleapis.com/scipro-bucket/lepton%20dujo.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(top: screenSize.width * 1 / 12),
                            width: screenSize.width / 3,
                            child: Divider(
                              color: Colors.red,
                              thickness: 3,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: screenSize.height * 0.7,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/leptondujobg.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenSize.width * 1),
                child: Container(
                  height: screenSize.width * 2,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    gradient: LinearGradient(
                      colors: [Color(0xFFD40469), Color(0xFF5F005B)],
                      //colors: [Colors.blue, Colors.blueGrey],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width * 0.005,
                  top: screenSize.width * 1.11,
                  //right: screenSize.width * 1/30
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 250,
                      child: Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 238, 238, 238)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: GetStudentsForSignUpDropDownButton(
                            schoolID: schoolID, classID: classID),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width * 1 / 13),
                      child: Container(
                        height: screenSize.width * 1 / 6.8,
                        width: screenSize.width * 0.65,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter Mail ID',
                                prefixIcon: Icon(Icons.mail_lock_sharp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width * 1 / 13),
                      child: Container(
                        height: screenSize.width * 1 / 6.8,
                        width: screenSize.width * 0.65,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width * 1 / 13),
                      child: Container(
                        height: screenSize.width * 1 / 6.8,
                        width: screenSize.width * 0.65,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Confirm Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(height: screenSize.width * 1 / 15),
                    Container(
                      height: screenSize.width * 1 / 7,
                      width: screenSize.width * 1 / 1.5,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(14)),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          padding: const EdgeInsets.all(9.0),
                          textStyle: const TextStyle(fontSize: 17),
                        ),
                        onPressed: () async {
                          Get.to(PhoneVerificationScreen(
                            classID: classID,
                            studentID: studentsListValue!["id"],
                            schooilID: schoolID,
                          ));
                          // await Get.to(ScreenPhoneLogin(
                          //   classID: classID,
                          //   schooilID: schoolID,
                          //   studentID: studentsListValue!["id"],
                          // ));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Profile(),
                          //     ));
                        },
                        child: const Text('SIGN UP'),
                      ),
                    ),
                    SizedBox(height: screenSize.width * 1 / 100),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenSize.width * 1 / 8,
                          top: screenSize.width * 1 / 29),
                      child: Row(children: [
                        Text(
                          "Don't have an account ? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          child: Container(
                            child: Text(
                              "Sign IN",
                              style: TextStyle(
                                  fontSize: 19, color: Colors.yellowAccent),
                            ),
                          ),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => DujoLogin(classID: classID,)),
                            // );
                            // Get.to(ScreenPhoneLogin(classID: classID,schooilID: schoolID,));
                          },
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
