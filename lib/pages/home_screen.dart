import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_tickets_booking_app/pages/profile_screen.dart';
import 'package:movie_tickets_booking_app/pages/splash_screen.dart';

import '../Service/api_service.dart';
import '../API/movie_catagory.dart';
import '../API/upcoming_catagory.dart';
import '../User_auth/firebase_auth_implementation/firebase_auth_services.dart';

class HomeScreen extends StatefulWidget {
  String userEmail;
  String userName;
  HomeScreen({required this.userEmail, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List recentMovies = ["Star Wars", "Aladdin", "Avatar", "Batman","Captain Marvel"];
  // List upComingMovies = ["Oppenheimer", "Jumanji", "Frozen", "127 Hours", "Pans Labyrinth", "Beauty And Beast", "Black Panther"];

  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.black12,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()),);
                  },
                  child: Image(
                    image: AssetImage("images/profile.jpeg"),
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Name and Email
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    widget.userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.userEmail,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

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
                            TextButton(onPressed: () async {
                              await _auth.signOut;
                              Navigator.pop(context);
                            }, child: Text("Cancel",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                color: Colors.blue
                              ),
                            ),
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                              }, child: Text("Log Out",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold
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
              ]
          ),
        ),


        // 2nd part
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(0xFF2F3236),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text("Playing Now",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Color(0xFFF7D300),
                          //color: Colors.purpleAccent.shade200,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // SizedBox(
              //   height: 390,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: EdgeInsets.all(8),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             InkWell(
              //               onTap: () {
              //                 Navigator.push(context, MaterialPageRoute(builder: (context) => SeatBookingScreen(movies: recentMovies[index])));
              //               },
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(15),
              //                 child: Image.asset(
              //                   "images/${recentMovies[index]}.jpeg",
              //                   height: 260,
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 4,
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     recentMovies[index],
              //                     style: TextStyle(
              //                       fontSize: 18,
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.w600,
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: 4,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Icon(
              //                         //FontAwesomeIcons.star,
              //                         Icons.star,
              //                         color: Color(0xFFF7D300),
              //                       ),
              //                       Text(
              //                         "4.5",
              //                         style: TextStyle(
              //                           fontSize: 16,
              //                           color: Color(0xFFF7D300),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   SizedBox(
              //                     height: 4,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Icon(
              //                         //FontAwesomeIcons.clock,
              //                         Icons.access_time_rounded,
              //                         color: Colors.white60,
              //                         size: 20,
              //                       ),
              //                       SizedBox(width:10),
              //                       Text(
              //                         "2hrs 30 min",
              //                         style: TextStyle(
              //                           color: Colors.white60,
              //                         ),
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              //


              SizedBox(
                height: 390,
                child: MovieCatagory(movieType: MovieType.nowPlaying,),
              ),

              //Up coming movie part

              SizedBox(height:5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(0xFF2F3236),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text("Coming Soon",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Color(0xFFF7D300),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5),

              SizedBox(
                height: 320,
                child: UpcomingCatagory(movieType: MovieType.upcoming,),
              ),

              // SizedBox(
              //   height: 300,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 7,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: EdgeInsets.all(8),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             // ClipRRect(
              //             //   borderRadius: BorderRadius.circular(15),
              //             //   child: Image.asset(
              //             //     "images/${upComingMovies[index]}.jpeg",
              //             //     fit: BoxFit.cover,
              //             //     height: 200,
              //             //     width: 180,
              //             //   ),
              //             // ),
              //
              //             ClipRRect(
              //               borderRadius: BorderRadius.circular(15),
              //               child: CachedNetworkImage(
              //                   height: 260,
              //                   fit: BoxFit.cover,
              //                   placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),
              //                   errorWidget: (context,url,error) => Icon(Icons.error),
              //                   imageUrl: kmoviedbImageurl + movieModel.posterPath.toString()
              //               ),
              //             ),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     upComingMovies[index],
              //                     style: TextStyle(
              //                       fontSize: 18,
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.w600,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );;
  }
}
