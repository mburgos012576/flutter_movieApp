import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo3_movieapp/models/movie_model.dart';
import 'package:flutter_codigo3_movieapp/utils/constants.dart';
import 'package:flutter_codigo3_movieapp/widgets/item_list_movie_widget.dart';
import 'package:flutter_codigo3_movieapp/widgets/my_drawer_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List movies = [];
  List<Movie> movies = [];


  @override
  initState() {
    super.initState();
    getDataMovie();
  }

  getDataMovie() async {

    String _path = "$urlBase/discover/movie?api_key=$apiKey";

    Uri _uri = Uri.parse(_path);

    http.Response response = await http.get(_uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      movies = data["results"].map<Movie>((item)=>Movie.fromJson(item)).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Movies",
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: MyDrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favoritos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up), label: "Me Gusta"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.all_inclusive),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Movies",
                style: TextStyle(
                    fontSize: 40,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500),
              ),
              ListView.builder(
                primary: true,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  // Movie myMovie = movies[index];
                  // myMovie.posterPath = "asdsadsd.jpg";
                  return ItemListMovieWidget(
                    // movie: myMovie,
                    movie: movies[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
