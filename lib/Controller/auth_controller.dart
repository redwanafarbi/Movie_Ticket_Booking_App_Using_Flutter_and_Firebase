import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/login_screen.dart';
import '../pages/home_screen.dart';

class AuthController extends GetxController{
  final AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false ;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(Duration(seconds: isLoging ? 0 : 2), () {
      if (user == null) {
        isLoging = false;
        update();
        Get.offAll(() => const LogInScreen());
      } else {
        isLoging = true;
        update();
        Get.offAll(() =>  HomeScreen());
      }
    });
  }

  void registerUser(email,password)async{
    try{
      isLoging = true ;
      update();
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      //getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
    } on FirebaseAuthException catch(e){
      //define error
      getErrorSnackBar("Registration Failed", e);
    }
  }

  getErrorSnackBar(String message, _){
    Get.snackbar(
      "Error",
      "$message\n${_.message}",
        snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
        colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom:10,left:10 ,right:10)
    );

  }

}