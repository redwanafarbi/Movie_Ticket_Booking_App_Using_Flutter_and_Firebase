import 'package:flutter/material.dart';
import 'package:movie_tickets_booking_app/Model/movie_model.dart';
import 'package:movie_tickets_booking_app/Service/api_service.dart';
import 'package:movie_tickets_booking_app/API/movie_list_item_now_playing.dart';

import 'movie_list_item_upcoming.dart';

class UpcomingCatagory extends StatefulWidget {

  final MovieType movieType ;

  const UpcomingCatagory({Key? key, required this.movieType}) : super(key: key);

  @override
  State<UpcomingCatagory> createState() => _UpcomingCatagoryState();
}

class _UpcomingCatagoryState extends State<UpcomingCatagory> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder( builder: (context, snapshot) {

      if(snapshot.hasData){
        List<MovieModel> movielist = snapshot.data ?? [];

        return ListView.builder(itemBuilder: (context,index){
          return MovieListItemUpcoming(movieModel: movielist[index]);
        },
          itemCount: 8,
          scrollDirection: Axis.horizontal,
        );
      }

      return Center(child: CircularProgressIndicator(),);

    }, future: apiService.getMovieData(widget.movieType),);
  }
}
