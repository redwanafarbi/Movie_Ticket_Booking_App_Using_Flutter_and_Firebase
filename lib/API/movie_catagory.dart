import 'package:flutter/material.dart';
import 'package:movie_tickets_booking_app/Model/movie_model.dart';
import 'package:movie_tickets_booking_app/Service/api_service.dart';
import 'package:movie_tickets_booking_app/API/movie_list_item_now_playing.dart';

class MovieCatagory extends StatefulWidget {

  final MovieType movieType ;

  const MovieCatagory({Key? key, required this.movieType}) : super(key: key);

  @override
  State<MovieCatagory> createState() => _MovieCatagoryState();
}

class _MovieCatagoryState extends State<MovieCatagory> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder( builder: (context, snapshot) {

      if(snapshot.hasData){
        List<MovieModel> movielist = snapshot.data ?? [];

        return ListView.builder(itemBuilder: (context,index){
          return MovieListItem(movieModel: movielist[index]);
        },
          itemCount: 3,
          scrollDirection: Axis.horizontal,
        );
      }

      return Center(child: CircularProgressIndicator(),);
      
    }, future: apiService.getMovieData(widget.movieType),);
  }
}
