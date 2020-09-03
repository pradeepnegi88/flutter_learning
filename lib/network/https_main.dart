import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  @override
  void initState() {
    super.initState();
    getPostById(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network http"),
      ),
      body: Center(
        child: Text("Network"),
      ),
    );
  }

  Future<http.Response> getPostById(int id) async {
    http.Response post =
        await http.get("https://jsonplaceholder.typicode.com/posts/$id");
    if (post.statusCode == 200) {
      print(post.body);
      return null;
    } else {
      throw Exception("Can't load the post");
    }
  }
}
