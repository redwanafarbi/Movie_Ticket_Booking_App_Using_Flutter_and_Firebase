import 'package:flutter/material.dart';
import 'package:movie_tickets_booking_app/pages/login_screen.dart';

class SplashScreen extends StatelessWidget {
  // const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
             image: AssetImage("images/background.jpeg"),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Rajshahi Cineplex",
            style: TextStyle(
               color: Colors.white,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            ),

            SizedBox(height: 30),
            Text("Grab your tickets now",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),

            // Get Started box
            SizedBox(height: 50),
            InkWell(
              onTap: (){
                // Click and move to log in page

                Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade600.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Get Strated",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )

          ],
        ),

      ),
    );
  }
}
