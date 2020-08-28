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
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogTwo(
                      title: "TO Continue",
                      description:
                          "Description data here just to check the custom dialog",
                      buttonText: "Submit",
                    );
                  });
            },
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

class Consts {
  Consts._();
  static const double padding = 16;
  static const double avatarRadius = 66;
}

class CustomDialogTwo extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  CustomDialogTwo({this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: Consts.avatarRadius + Consts.padding,
              bottom: Consts.padding,
              left: Consts.padding,
              right: Consts.padding,
            ),
            margin: EdgeInsets.only(top: Consts.avatarRadius),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 10, offset: Offset(0, 10))
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                SizedBox(height: 16),
                Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    child: Text(buttonText),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: Consts.avatarRadius,
            ),
          )
        ],
      ),
    );
  }
}
