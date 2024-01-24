
import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_tickets_booking_app/Model/movie_model.dart';

import '../Constant/constant.dart';

enum MovieType{nowPlaying, upcoming}


class ApiService{

  Future<List<MovieModel>> getMovieData(MovieType type)async{
    String url = "" ;

    if(type == MovieType.nowPlaying){
      url = kmovieDbURL + know_playing ;
    }else if(type == MovieType.upcoming){
      url = kmovieDbURL + kupcoming ;
    }

    try{
      Response response = await get(Uri.parse(
          url+ "?api_key=ab26c508c2e211bdd6b7651bf60c250b&language=en-US"
      ));

      if(response.statusCode == 200){

        Map<String, dynamic>json = jsonDecode(response.body);

        List<dynamic>body = json['results'];

        List<MovieModel>movielist = body.map((item)=>MovieModel.fromJson(item)).toList();

        return movielist;

      }else{
        throw("No match found");
      }

    }catch(e){
      throw e.toString();
    }
  }

}