import 'package:flutter/material.dart';

class StateManagementBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        canvasColor: Colors.white70.withRed(20),
      ),
      home: StateManagementBuilderHome(),
    );
  }
}

class StateManagementBuilderHome extends StatelessWidget {
  var counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StateFulBuilder")),
      body: StatefulBuilder(
        builder: (context, state) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove,
                    size: 50,
                  ),
                  onPressed: () {
                    state(() {
                      counter--;
                    });
                  },
                ),
                Text(
                  counter.toString(),
                  style: TextStyle(fontSize: 100),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 50,
                  ),
                  onPressed: () {
                    state(() {
                      counter++;
                    });
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
