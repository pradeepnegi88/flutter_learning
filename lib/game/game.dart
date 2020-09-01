import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final Map<String, bool> score = {};
  final Map<String, Color> choices = {
    '🍎': Colors.red,
    '🍋': Colors.yellow,
    '🥭': Colors.redAccent,
    '🍐': Colors.green,
    '🍇': Colors.pink,
    '🍏': Colors.lightGreen
  };
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Game"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: choices.keys
                  .map(
                    (items) => Expanded(
                      child: Draggable(
                        child: Movable(items),
                        feedback: Movable(items),
                        childWhenDragging: Movable(items),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: choices.keys.map(
                (items) {
                  return DragTarget(
                    builder: (context, incoming, rejects) {
                      if (score[items] == true) {
                        return Container(
                          color: Colors.white,
                          child: Text("Congratulations!!!"),
                          alignment: Alignment.center,
                          height: 80,
                          width: 200,
                        );
                      } else {
                        return Container(
                          color: choices[items],
                          alignment: Alignment.center,
                          height: 80,
                          width: 200,
                        );
                      }
                    },
                    onWillAccept: (data) => data == items,
                    onAccept: (data) {
                      setState(() {
                        score[items] = true;
                      });
                    },
                    onLeave: (data) {},
                  );
                },
              ).toList()
                ..shuffle(Random(index)),
            )
          ],
        ),
      ),
    );
  }
}

class Movable extends StatelessWidget {
  final String emoji;
  Movable(this.emoji);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.all(15),
        child: Text(
          emoji,
          style: TextStyle(
            color: Colors.black,
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}
