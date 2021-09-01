

import 'package:flutter/material.dart';

class MyDrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}

