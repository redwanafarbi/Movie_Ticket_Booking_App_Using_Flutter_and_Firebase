
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_tickets_booking_app/Controller/auth_controller.dart';
import 'package:movie_tickets_booking_app/User_Data/user_data.dart';
import 'package:movie_tickets_booking_app/pages/login_screen.dart';
import 'package:get/get.dart';

import '../User_auth/firebase_auth_implementation/firebase_auth_services.dart';
import '../utils/form_container_widgets.dart';
import '../utils/social.dart';
import 'home_screen.dart';

class SignUp extends StatefulWidget {

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _userInfo = userInfo();
   // var userInformation = Map<dynamic,dynamic>();

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isSignUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color(0x211F32),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          height: _size.height,
          width: _size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Welcome To The Movie World",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Sign Up to book your tickets now",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),


              // Create new account form box
              Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                width: _size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create your own account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // User name box
                    SizedBox(
                      height: 30,
                    ),
                    FormContainerWidget(
                      controller: _usernameController,
                      hintText: "Username",
                      isPasswordField: false,
                    ),

                    //Email box
                    SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      controller: _emailController,
                      hintText: "Email",
                      isPasswordField: false,
                    ),


                    // Password box
                    SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      controller: _passwordController,
                      hintText: "Password",
                      isPasswordField: true,
                    ),

                    // Confirm password box
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 15),
                    //   child: TextFormField(
                    //     controller: cnfPasswordController,
                    //     obscureText: true,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //       hintText: "Confirm Password",
                    //       hintStyle: const TextStyle(color: Colors.black45),
                    //       fillColor: Colors.grey.shade300,
                    //       filled: true,
                    //     ),
                    //   ),
                    // ),


                    // Sign up button

                    const SizedBox(height: 15,),

                    GestureDetector(
                      onTap:  (){
                        _signUp();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: _isSignUp ? CircularProgressIndicator(color: Colors.white,): Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                          ),
                        )),
                      ),

                    const SizedBox(height: 15),
                    Center(
                      child: Text(
                        "Or",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // Google log in method
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: SocialLoginButtons(onGoogleClick: () {}),
                    )
                  ],
                ),
              ),

              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(fontWeight: FontWeight.w700,fontSize:15),
                  ),
                  TextSpan(
                      text: " Login",
                      style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize:15),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Tap and go to sign up page
                        Get.back();
                      }
                  ),

                  // TextSpan(
                  //   text: " here",
                  //   style: TextStyle(fontWeight: FontWeight.w700),
                  // ),
                ]),

              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async{

    setState(() {
      _isSignUp = true ;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      _isSignUp = false;
    });

    if(user != null){
      print("User is successfully created");
      _userInfo.data(email.toString(),username.toString());

      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(userEmail: email,userName: username,)));
    }else{
      print("Some error happend");
    }

  }
}

