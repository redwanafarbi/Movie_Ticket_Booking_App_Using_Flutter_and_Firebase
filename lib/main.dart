import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_tickets_booking_app/Controller/auth_controller.dart';
import 'package:movie_tickets_booking_app/pages/splash_screen.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.lazyPut(() => AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0x14121F),
        splashColor: Color(0xFF21249),
        brightness: Brightness.light,
        useMaterial3: false,
      ),

      home: SplashScreen() ,
    );
  }
}
