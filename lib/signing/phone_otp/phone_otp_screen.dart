// ignore_for_file: file_names


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_offical_apk/signing/phone_otp/phone_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/Bloc/Phone_otp/auth_cubit.dart';
import '../../controllers/Bloc/Phone_otp/auth_state.dart';

class ScreenPhoneLogin extends StatefulWidget {
  var phoneNumber;
   var schooilID;
   var classID;
   var studentID;
   
  // ignore: prefer_const_constructors_in_immutables
  ScreenPhoneLogin({required this.classID,this.schooilID,required this.studentID, super.key});

  @override
  State<ScreenPhoneLogin> createState() => _ScreenPhoneLoginState();
}

class _ScreenPhoneLoginState extends State<ScreenPhoneLogin> {

  var PhoneNumber='dddd';
 


  @override
  void initState() {
    @override
    void initState() {
      // getFacultyId();
      super.initState();

    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.schooilID);
  
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  LottieBuilder.asset('assest/Images/otpverfication.json'),
                  const Text(
                    'Phone Verification',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('We need to register your phone before getting'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('started!'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.amber,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        const Text(
                          '|',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                              fontWeight: FontWeight.w100),
                        ),
                        // Icon(Icons.line),
                        Expanded(
                          child:Container(
                            child: Center(child: Text(PhoneNumber),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthCodeSentState) {
                        Get.offAll(ScreenOtpVerfication());
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              // ignore: deprecated_member_use
                              primary: Colors.green.shade600),
                          onPressed: () async {
                            String phoneNumber =
                                "+91$PhoneNumber";
                            BlocProvider.of<AuthCubit>(context)
                                .sentOTP(phoneNumber);
                          },
                          child: const Text('Send OTP'));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  //   void getFacultyId() async {
  //   var vari = await FirebaseFirestore.instance
  //       .collection("SchoolListCollection")
  //       .doc(widget.schooilID).collection("Classes").doc(widget.classID).collection(widget.classID).doc(widget.schooilID)
  //       .get();
  //   setState(() {
  //     PhoneNumber = vari.data()!['parentPhNo'];
  //   });
  // }
}
