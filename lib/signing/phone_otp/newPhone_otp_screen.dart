import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_offical_apk/signing/phone_otp/phone_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../controllers/Bloc/Phone_otp/auth_cubit.dart';
import '../../controllers/Bloc/Phone_otp/auth_state.dart';
import '../Get_students/get_students_drop_downlist.dart';

class PhoneVerificationScreen extends StatefulWidget {
  var schooilID;
  var classID;
  var studentID;
  PhoneVerificationScreen(
      {required this.classID,
      this.schooilID,
      required this.studentID,
      super.key});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
       String phoneNumber = "";
 
  @override
  void initState() {
    getUserPhoneNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    log("number?>>>>>>>>>>>>>${phoneNumber}");
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
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
                            String verifyNumber =
                                "+91$phoneNumber";
                            BlocProvider.of<AuthCubit>(context)
                                .sentOTP(verifyNumber);
                                log(verifyNumber);
                          },
                          child: const Text('Send OTP'));
                    },
                  ),
      ),
    );
  }

  void getUserPhoneNumber() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schooilID)
        .collection("Classes")
        .doc(widget.classID)
        .collection(widget.classID)
        .doc(widget.studentID)
        .get();
    setState(() {
  phoneNumber = vari.data()!['parentPhNo'.toString()];
    });
    log(vari.data().toString());
  }
}
