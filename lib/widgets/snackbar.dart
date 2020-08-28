import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
  final scafforlKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NavigationBar",
      theme: ThemeData(
        canvasColor: Colors.pinkAccent.shade200,
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        key: scafforlKey,
        appBar: AppBar(
          title: Text("NavigationBar"),
        ),
        body: Center(
          child: Text("NavigationBar"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/lake.jpg"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Life is beautiful"),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.settings_input_composite),
                title: Text("logout"),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: null,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: () {
            scafforlKey.currentState.showSnackBar(
              SnackBar(
                content: Text("Flutter SnackBar snackbar"),
              ),
            );
          },
        ),
      ),
    );
  }
}

// 3 Solutions for context
// First is build function
// Second using the builder widget
// Third global key

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.plus_one),
      onPressed: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Flutter SnackBar build function"),
          ),
        );
      },
    );
  }
}
