import 'package:dujo_offical_apk/controllers/Bloc/Phone_otp/auth_cubit.dart';
import 'package:dujo_offical_apk/controllers/Bloc/Phone_otp/auth_state.dart';
import 'package:dujo_offical_apk/controllers/get_schoolList/getx_language.dart';
import 'package:dujo_offical_apk/school/school_student_profile.dart';

import 'package:dujo_offical_apk/selct_language.dart';
import 'package:dujo_offical_apk/signing/appLoginInterface.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

bool? seenonboard;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenonboard = pref.getBool('seenonboard') ?? false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: GetMaterialApp(
        translations: GetxLanguage(),
        locale: Locale('en', 'US'),
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (oldstate,newstate){
            return oldstate is AuthInitialState;
          },
          builder: (context, state) {
            if (state is AuthLoggedInState) {
              return StudentProfile();
              
            }else if (state is AuthLoggedOutState){
              return SelectLanguage();

            }
            return StudentProfile();
          },
        ),

        // home:Onboardingpage(),
      ),
    );
  }
}
