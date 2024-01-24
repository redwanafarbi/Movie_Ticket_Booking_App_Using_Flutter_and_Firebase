import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_tickets_booking_app/Constant/constant.dart';
import 'package:movie_tickets_booking_app/Model/movie_model.dart';

import '../pages/seat_booking_screen.dart';

class MovieListItem extends StatelessWidget {
  final MovieModel movieModel ;

  const MovieListItem({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SeatBookingScreen(movieTitle: movieModel.title.toString())));
      },
      child: Container(
        width: 210,
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
              height: 260,
              fit: BoxFit.cover,
              placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),
                errorWidget: (context,url,error) => Icon(Icons.error),
                imageUrl: kmoviedbImageurl + movieModel.posterPath.toString()
                      ),
            ),

        Text(
            movieModel.title.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),

        Row(
          children: [
            RatingBarIndicator(
              rating: movieModel.voteAverage ?? 0,
              itemBuilder: (context,index){
              return Icon(Icons.star, color: Colors.amber,);

            },itemCount: 5, itemSize: 15, direction: Axis.horizontal,),

            SizedBox(width: 10),
            Text(
              movieModel.voteAverage == null? " ": movieModel.voteAverage.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
            SizedBox(height: 5),
      Row(
        children: [
          Icon(
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
    );
  }
}
