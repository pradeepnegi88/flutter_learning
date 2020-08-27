import 'package:flutter/material.dart';
import '../model/choice.dart';

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  List<Choice> choice = <Choice>[
    const Choice(title: "Bicycle", icon: Icons.directions_bike),
    const Choice(title: "Car", icon: Icons.directions_car),
    const Choice(title: "Bus", icon: Icons.directions_bus),
    const Choice(title: "Boat", icon: Icons.directions_boat),
    const Choice(title: "Walk", icon: Icons.directions_walk),
    const Choice(title: "Train", icon: Icons.directions_railway),
  ];
  Choice selectedIcon;

  @override
  void initState() {
    super.initState();
    selectedIcon = choice.elementAt(0);
  }

  @override
  Widget build(BuildContext context) {
    // var popupMenuButton = PopupMenuButton(
    //   itemBuilder: (context) {
    //     return choice
    //         .map(
    //           (item) => PopupMenuItem(
    //             value: item.title,
    //             child: Text(item.title),
    //           ),
    //         )
    //         .toList();
    //   },
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AppBar",
      theme: ThemeData(
        canvasColor: Colors.grey.shade400,
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return choice
                    .map(
                      (value) => PopupMenuItem(
                        child: Text(value.title),
                        value: value,
                      ),
                    )
                    .toList();
              },
              onCanceled: null,
              onSelected: (value) {
                setState(() {});
                selectedIcon = value;
              },
            ),
          ],
        ),
        body: Center(
            child: Icon(
          selectedIcon.icon,
          size: 100,
        )),
      ),
    );
  }

  actionItems() {
    choice
        .map(
          (value) => IconButton(
            focusColor: Colors.blue,
            icon: Icon(value.icon),
            onPressed: () {
              setState(() {
                selectedIcon = value;
              });
            },
          ),
        )
        .toList();
  }
}
