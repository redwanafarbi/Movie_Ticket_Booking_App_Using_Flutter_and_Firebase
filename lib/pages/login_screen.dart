import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_tickets_booking_app/utils/social.dart';
import 'package:movie_tickets_booking_app/pages/sign_up_screen.dart';
import 'package:get/get.dart';

import '../User_auth/firebase_auth_implementation/firebase_auth_services.dart';
import '../utils/form_container_widgets.dart';
import 'home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isSigning = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
                padding: EdgeInsets.only(top: 20),
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
                    SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      controller: _emailController,
                      hintText: "Email Address",
                      isPasswordField: false,
                    ),

                    //Password
                    SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      controller: _passwordController,
                      hintText: "Password",
                      isPasswordField: true,
                    ),


                    // Forget button
                    TextButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context){
                          return Container(
                            child: AlertDialog(
                              title: Text("Forget Password?",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              content: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Email Address",
                                  hintStyle: const TextStyle(color: Colors.black45),
                                ),
                              ),
                              actions: [
                                TextButton(onPressed: (){},
                                    child: Text("Send",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),),
                              ],
                            ),
                          );
                        }
                        );
                      },
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
                    GestureDetector(
                      onTap:  (){
                        _signIn();
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
                              child: _isSigning ? CircularProgressIndicator(color: Colors.white,): Text(
                                "Log In ",
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

                    //Google Login Method
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap:  (){
                        _signInWithGoogle();
                      },
                      child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.google, color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text(
                                    "Sign in with Google ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),

                    // Facebook log in method
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap:  (){
                      },
                      child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.facebook, color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text(
                                    "Sign in with Facebook ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),

              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize:15),
                  ),
                  TextSpan(
                      text: " Sing up",
                      style: TextStyle(decoration: TextDecoration.underline,fontSize:15, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Tap and go to sign up page
                        Get.to(SignUp());
                      }
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async{

    setState(() {
      _isSigning = true ;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false ;
    });

    if(user != null){
      print("User is successfully LogIn");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      //Navigator.pushNamed(context, "/home");
    }else{
      print("Some error happend");
    }
  }

  _signInWithGoogle()async{

    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try{

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if(googleSignInAccount != null ){
        final GoogleSignInAuthentication googleSignInAuthentication = await
        googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }

    }catch(e){
      getErrorSnackBar("Some error occured", e);
    }
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
