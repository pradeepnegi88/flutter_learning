import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mycounter.dart';

class ProviderMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lime,
        canvasColor: Colors.lime.shade200,
      ),
      home: ProviderHomeWidget(),
    );
  }
}

class ProviderHomeWidget extends StatelessWidget {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider")),
      body: ChangeNotifierProvider<MyCounter>(
        create: (context) => MyCounter(),
        child: Center(
          child: Column(
            children: [
              Consumer<MyCounter>(builder: (context, mycounter, widget) {
                return IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 50,
                  ),
                  onPressed: () {
                    mycounter.inc();
                  },
                );
              }),
              Consumer<MyCounter>(builder: (context, mycounter, widget) {
                return Text(
                  mycounter.counter.toString(),
                  style: TextStyle(fontSize: 50),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
