import 'package:flutter/material.dart';
import 'package:myapp/push_pop/push_home.dart';
import 'package:myapp/push_pop/screen1.dart';

class ScreenTwo extends StatelessWidget {
  static const route = "/screen2";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two'),
      ),
      body: Center(
          child: Container(
        color: Colors.indigo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Screen Two"),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil(PushHome.route, (route) => false),
              child: Text("Home"),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenOne()),
                  ModalRoute.withName(PushHome.route)),
              child: Text("Second screen"),
            ),
            RaisedButton(
              onPressed: () =>
                  Navigator.popAndPushNamed(context, ScreenOne.route),
              child: Text("popAndPushNamed"),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("pop"),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context)
                  .popUntil(ModalRoute.withName(PushHome.route)),
              child: Text("popUntil"),
            ),
          ],
        ),
      )),
    );
  }
}
