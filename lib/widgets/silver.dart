import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SilverWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material Widget",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: Colors.purple.shade100,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material Widget'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              ListTile(
                title: Text("Title"),
              ),
              ListTile(
                title: Text("Title"),
              ),
              ListTile(
                title: Text("Title"),
              ),
              ListTile(
                title: Text("Title"),
              ),
              ListTile(
                title: Text("Title"),
              ),
              ListTile(
                title: Text("Title"),
              ),
              ListTile(
                title: Text("Title"),
              ),
              ListTile(
                title: Text("Title"),
              ),
              ListTile(
                title: Text("Title"),
              ),
            ])),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: 200,
                    ),
                    Text(
                      "This is something longer tesxt should be centered with the logo",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
