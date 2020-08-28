import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Examples"),
      ),
      body: SimpleAlertDialogWidget(),
    );
  }
}

class SimpleAlertDialogWidget extends StatelessWidget {
  const SimpleAlertDialogWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RaisedButton(
            onPressed: () {
              showSimpleAlertDialog(context);
            },
            child: Text("Show Alert Dialog"),
          ),
          RaisedButton(
            onPressed: () {
              buildShowCustomDialog(context);
            },
            child: Text("Show Custom Dialog One "),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Show Custom Dialog Two "),
          )
        ],
      ),
    );
  }

  Future buildShowCustomDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    "Title",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Divider(color: Colors.grey),
                TextField(
                  decoration: InputDecoration(hintText: "Enter you data"),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future showSimpleAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("My Alert Dialog"),
        content: Container(
          height: 250,
          child: Column(
            children: [
              Image.asset("images/lake.jpg", fit: BoxFit.cover),
              Text("This is the Alert Dialog content ........ "),
            ],
          ),
        ),
        actions: [
          RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"))
        ],
      ),
    );
  }
}
