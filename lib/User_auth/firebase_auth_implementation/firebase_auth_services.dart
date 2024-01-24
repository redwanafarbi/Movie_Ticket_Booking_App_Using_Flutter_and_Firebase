
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../Global/Common/toast.dart';

class FirebaseAuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password)async{

    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }on FirebaseAuthException catch(e){
      if (e.code == 'email-already-in-use') {
        getErrorSnackBar("The email address is already in use", e);
        //showToast(message: 'The email address is already in use.');
      } else {
        getErrorSnackBar("An error occurred", e);
        //showToast(message: 'An error occurred: ${e.code}');
      }
    }

    return null ;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password)async{

    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        getErrorSnackBar("Invalid email or password", e);
        //showToast(message: 'Invalid email or password.');
      } else {
        getErrorSnackBar("An error occured", e);
        //showToast(message: 'An error occurred: ${e.code}');
      }
    }

    return null ;
  }

  getErrorSnackBar(String message, _){
    Get.snackbar(
        "Error",
        "$message\n${_.message}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.only(bottom:10,left:10 ,right:10)
    );
  }
}