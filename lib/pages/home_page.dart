import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List movies = [];
  String pathImage = "https://image.tmdb.org/t/p/w500";

  @override
  initState() {
    super.initState();
    getDataMovie();
  }

  getDataMovie() async {

    String api_key = "077c6b8e215715b477754b84846c0f95";
    String _path =
        "https://api.themoviedb.org/3/discover/movie?api_key=$api_key";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      movies = data["results"];
      print(movies.length);
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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://image.freepik.com/free-vector/colorful-abstract-wallpaper-design_23-2148467625.jpg",
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/845457/pexels-photo-845457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                  ),
                  Text(
                    "Ramoncito Flores",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Editor",
                    style: TextStyle(fontSize: 13.0, color: Colors.white70),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("Películas"),
              trailing: Icon(Icons.movie),
              onTap: () {},
            ),
            ListTile(
              title: Text("Televisión"),
              trailing: Icon(Icons.tv),
              onTap: () {},
            ),
            Divider(
              thickness: 0.9,
            ),
            ListTile(
              title: Text("Cerrar Sesión"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () {},
            ),
          ],
        ),
      ),
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
                  fontWeight: FontWeight.w500
                ),
              ),
              ListView.builder(
                primary: true,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index){

                  String urlImage = pathImage + movies[index]["poster_path"];

                  return Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(urlImage),
                          )
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movies[index]["original_title"]),
                              Text(movies[index]["overview"], maxLines: 3,overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                      ),
                    ],
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
