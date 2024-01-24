import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_tickets_booking_app/Constant/constant.dart';
import 'package:movie_tickets_booking_app/Model/movie_model.dart';

class MovieListItemUpcoming extends StatelessWidget {
  final MovieModel movieModel ;

  const MovieListItemUpcoming({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
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

          SizedBox(height: 2),
          Text(
            movieModel.title.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
