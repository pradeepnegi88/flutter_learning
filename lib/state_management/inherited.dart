import 'package:flutter/material.dart';

import 'counter_inherited.dart';

class InheritWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          canvasColor: Colors.white70.withRed(20),
        ),
        home: StateManagementInheritedHome(),
      ),
    );
  }
}

class AnotherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = CounterProvider.of(context);

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        child: Text(
          provider.counter.toString(),
          style: TextStyle(fontSize: 100),
        ),
      ),
    );
  }
}

class StateManagementInheritedHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("InheritWidget")),
      body: StatefulBuilder(builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.counter.toString(),
                style: TextStyle(fontSize: 50),
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 50,
                ),
                onPressed: () {
                  state(() {
                    provider.counter++;
                  });
                },
              ),
              AnotherWidget(),
            ],
          ),
        );
      }),
    );
  }
}
