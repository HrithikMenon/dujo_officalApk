import 'package:dujo_offical_apk/controllers/get_schoolList/getx_language.dart';
import 'package:dujo_offical_apk/home/home.dart';
import 'package:dujo_offical_apk/home/on_bording_section/on_bording.dart';
import 'package:dujo_offical_apk/selct_language.dart';
import 'package:dujo_offical_apk/signing/appLoginInterface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
bool? seenonboard;
Future<void> main() async{
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
    return  GetMaterialApp(
      translations: GetxLanguage(),
      locale: Locale('en','US'),
      home: SelectLanguage(),

      // home:Onboardingpage(),
    );
  }
}
