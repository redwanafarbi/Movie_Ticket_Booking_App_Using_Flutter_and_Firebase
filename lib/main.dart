import 'package:flutter/material.dart';
import 'package:movie_tickets_booking_app/pages/splash_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF21249),
        splashColor: Color(0xFF21249),
      ),
      home: SplashScreen() ,
    );
  }
}
