import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/post.dart';

class NetworkMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        canvasColor: Colors.yellow.shade200.withGreen(20),
      ),
      home: NetworkHome(),
    );
  }
}

class NetworkHome extends StatefulWidget {
  @override
  _NetworkHomeState createState() => _NetworkHomeState();
}

class _NetworkHomeState extends State<NetworkHome> {
  Future<Post> futurePost;
  @override
  void initState() {
    super.initState();
    futurePost = getPostById(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network http"),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text(snapshot.error);
            }
            return CircularProgressIndicator();
          },
          future: futurePost,
        ),
      ),
    );
  }

  Future<Post> getPostById(int id) async {
    http.Response post =
        await http.get("https://jsonplaceholder.typicode.com/posts/$id");
    if (post.statusCode == 200) {
      print(post.body);
      return Post.fromJson(json.decode(post.body));
    } else {
      throw Exception("Can't load the post");
    }
  }
}
