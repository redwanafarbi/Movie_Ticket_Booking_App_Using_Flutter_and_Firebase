import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_tickets_booking_app/pages/splash_screen.dart';

import '../utils/seat_pattern.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: (){
              showDialog(context: context, builder: (context){
                return Container(
                  child: AlertDialog(
                    title: Text("Log Out?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: Text("Are you sure you want to log out?",
                        style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Cancel"),
                        ),
                      TextButton(
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                      }, child: Text("Log Out",
                        style: TextStyle(
                          color: Colors.red.shade900,
                        ),
                      ),
                      ),
                    ],
                  ),
                );
              }
              );
            },
              icon: Icon(
                  Icons.logout_outlined
                ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(120),
                      bottomLeft: Radius.circular(120)),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 100),
                  child:SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 4),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image(
                                height: 120,
                                width: 120,
                                image: AssetImage("images/profile.jpeg",),
                              ),
                            ),
                          ),
                        ),

                        //User name
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 78.0),
                          child: Text("Name",style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
                            readOnly: false,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(borderSide: BorderSide.none),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Colors.black87,
                                  ),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              suffixIcon: GestureDetector(
                                onTap: (){
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: Colors.black87,
                                    ),
                                ),
                              ),

                            ),
                          ),
                        ),

                        // user email
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 78.0),
                          child: Text("Email", style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
                            readOnly: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(borderSide: BorderSide.none),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Colors.black87,
                                  ),
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              suffixIcon: GestureDetector(
                                onTap: (){},
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    //FontAwesomeIcons.pen,
                                    Icons.edit_outlined,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),

                            ),
                          ),
                        ),

                        // User phone number
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 75.0),
                          child: Text("Mobile Number", style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
                            readOnly: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(borderSide: BorderSide.none),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Colors.black87,
                                  ),
                                  child: Icon(
                                    //FontAwesomeIcons.mobile,
                                    Icons.phone_android_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              suffixIcon: GestureDetector(
                                onTap: (){},
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    //FontAwesomeIcons.penToSquare,
                                    Icons.edit_outlined,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),

                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:10.0,right: 20.0, left: 20.0),
                          child: const Divider(
                            thickness: 1,
                            color: Colors.black87,
                          ),
                        ),

                        SizedBox(
                          height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.black26.withAlpha(20),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child:
                                Text("Booking Details",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        for (int i = 1; i <= itemCount; i++) ...[
                          Container(
                            child: Center(
                              child: DecoratedBox(
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black,width:2),
                              ),
                                child: SizedBox(
                                  height: 120,
                                  width: 350,
                                  child: ListView(
                                    children: [
                                      ListTile(
                                        leading: Image.asset('images/Frozen.jpeg',),
                                        title: Text("Frozen") ,
                                        subtitle:Text("Date") ,
                                        trailing: Icon(Icons.delete) ,

                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   child: Center(
                          //     child: DecoratedBox(
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10),
                          //         border: Border.all(color: Colors.black,width:2),
                          //       ),
                          //       child: SizedBox(
                          //         height: 120,
                          //         width: 350,
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Row(
                          //             children: [
                          //               SizedBox(
                          //                 height: 120,
                          //                 width: 50,
                          //                 child: Image.asset('images/Frozen.jpeg',),
                          //               ),
                          //               Padding(
                          //                 padding: const EdgeInsets.only(top:5.0, left: 5.0),
                          //                 child: Column(
                          //                   children: [
                          //                     Text("Movie name", style: TextStyle(
                          //                       fontSize: 15,
                          //                     ),),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Row(
                          //                 mainAxisAlignment: MainAxisAlignment.start,
                          //                 children: [
                          //                   Text("Date: ", style: TextStyle(
                          //                     fontSize: 15,
                          //                   ),),
                          //                 ],
                          //               ),
                          //               Row(
                          //                 children: [
                          //                   Text("Time: ", style: TextStyle(
                          //                     fontSize: 15,
                          //                   ),),
                          //                 ],
                          //               ),
                          //               // Row(
                          //               //   children: [
                          //               //     Text("Seat Number: ", style: TextStyle(
                          //               //       fontSize: 15,
                          //               //     ),),
                          //               //   ],
                          //               // ),
                          //             ],
                          //           ),
                          //         ),
                          //
                          //       ),
                          //     ),
                          //   )
                          // ),
                          SizedBox(height: 10,),
                        ],
                      ],
                    ),
                  )
              ),

              Positioned(
                top: 180,
                  left: MediaQuery.of(context).size.width * 0.5 + 20 ,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black87,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
