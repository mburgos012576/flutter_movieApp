
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codigo3_movieapp/models/movie_detail_model.dart';
import 'package:flutter_codigo3_movieapp/models/movie_model.dart';
import 'package:flutter_codigo3_movieapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class DetailMoviePage extends StatefulWidget {

  Movie movie;
  DetailMoviePage({required this.movie});

  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {

  MovieDetail? movieDetail;

  @override
  initState(){
    super.initState();
    getDataMovie();
  }

  getDataMovie() async {
      String path = "$urlBase/movie/${widget.movie.id}?api_key=$apiKey";
      Uri _uri = Uri.parse(path);
      http.Response response = await http.get(_uri);
      if(response.statusCode == 200){
        Map<String, dynamic> myMap = json.decode(response.body);
        movieDetail = MovieDetail.fromJson(myMap);
        setState(() {

        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 260.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Mi película favorita"),
                background: Image.network("https://i2.wp.com/codigoespagueti.com/wp-content/uploads/2021/02/batman-dc-comics.jpg?fit=1280%2C720&quality=80&ssl=1"),
              ),
            ),
          ];
        },
        body: SafeArea(
          child: Container(),
        ),
      ),
    );
  }
}
