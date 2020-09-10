import 'package:flutter/material.dart';
import 'package:myapp/provider/provider_second.dart';
import 'package:provider/provider.dart';

import 'mycounter.dart';

class ProviderMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyCounter>(
        create: (context) => MyCounter(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lime,
            canvasColor: Colors.lime.shade200,
          ),
          home: ProviderHomeWidget(),
        ));
    ;
  }
}

class ProviderHomeWidget extends StatelessWidget {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    var model = context.watch<MyCounter>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProviderSecond()));
            },
            icon: Icon(Icons.note_add),
          )
        ],
      ),
      body: Center(
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
            IconButton(
              icon: Icon(
                Icons.add,
                size: 50,
              ),
              onPressed: () {
                model.inc();
              },
            ),
            TextDisplay(),
            AnotherExample()
          ],
        ),
      ),
    );
  }
}

class TextDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //only read
    var muCounter = context.select((MyCounter value) => value.counter);
    return Text(
      muCounter.toString(),
      style: TextStyle(fontSize: 50),
    );
  }
}

class AnotherExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myModel = context.select((MyCounter value) => value.counter);
    return Center(
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 50,
            ),
            onPressed: () {
              Provider.of<MyCounter>(context, listen: false).inc();
            },
          ),
          Text(
            myModel.toString(),
            style: TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}
