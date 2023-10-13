import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_tickets_booking_app/pages/home_screen.dart';
import 'package:movie_tickets_booking_app/utils/social.dart';
import 'package:movie_tickets_booking_app/pages/sign_up_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
                padding: EdgeInsets.only(top: 100),
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
              const SizedBox(height: 20),
              // login form box

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
                      "Login to your account",
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
                          hintText: "Username",
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

                    // Forget button
                    TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // log in box
                    ElevatedButton(
                      onPressed: () {
                        // Have to remove letter
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()),);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),),
                      child: const Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "LOGIN",
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
                    text: "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                      text: " Sing up",
                      style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Tap and go to sign up page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp() ));
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
