import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_tickets_booking_app/pages/movie_details_screen.dart';
import 'package:movie_tickets_booking_app/pages/profile_screen.dart';
import 'package:movie_tickets_booking_app/pages/seat_booking_screen.dart';

class HomeScreen extends StatelessWidget {
  List recentMovies = ["Star Wars", "Aladdin", "Avatar", "Batman","Captain Marvel"];
  List upComingMovies = ["Oppenheimer", "Jumanji", "Frozen", "127 Hours", "Pans Labyrinth", "Beauty And Beast", "Black Panther"];


// Statefull banate hobe
// class HomeScreen extends StatefulWidget {
//  const HomeScreen({Key? key}) : super(key: key);
//
//  @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.black87,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()),);
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
                    "Name",
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
                  "Email",
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
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.search,
                  //Icons.search_outlined,
                  color: Colors.white,
                  size: 33,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.bell,
                  //Icons.notifications_outlined,
                  color: Colors.white,
                  size: 33,
                ),
              ),
            ],
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
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 390,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SeatBookingScreen(movies: recentMovies[index])));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/${recentMovies[index]}.jpeg",
                                height: 260,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recentMovies[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      //FontAwesomeIcons.star,
                                      Icons.star,
                                      color: Color(0xFFF7D300),
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFF7D300),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      //FontAwesomeIcons.clock,
                                      Icons.access_time_rounded,
                                      color: Colors.white60,
                                      size: 20,
                                    ),
                                    SizedBox(width:10),
                                    Text(
                                      "2hrs 30 min",
                                      style: TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),


              //Up coming movie part
              SizedBox(height:1),
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
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/${upComingMovies[index]}.jpeg",
                                fit: BoxFit.cover,
                                height: 200,
                                width: 180,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  upComingMovies[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
