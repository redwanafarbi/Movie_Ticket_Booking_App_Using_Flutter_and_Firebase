import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_tickets_booking_app/pages/login_screen.dart';

import '../utils/social.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.black87,
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
                "Login to book your tickets now and enjoy the movie",
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
                // height: _size.height,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Name",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                        ),
                      ),
                    ),

                    // User mail box
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Email Address",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                        ),
                      ),
                    ),

                    // Password box
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                        ),
                      ),
                    ),

                    // Confirm password box
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Confirm Password",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15,),

                    // Sign up button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                      text: " Login",
                      style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Tap and go to sign up page
                        Navigator.pop(context, MaterialPageRoute(builder: (context) => LogInScreen() ));
                      }
                  ),

                  TextSpan(
                    text: " here",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
