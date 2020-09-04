import 'package:flutter/material.dart';
import 'package:myapp/provider/mycounter.dart';
import 'package:provider/provider.dart';

class ProviderSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderSecond"),
      ),
      body: Center(
        child: Consumer<MyCounter>(
          builder: (BuildContext context, value, Widget child) {
            return Column(
              children: [
                Text(
                  value.counter.toString(),
                  style: TextStyle(fontSize: 50),
                ),
                IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 50,
                    ),
                    onPressed: () => value.inc())
              ],
            );
          },
        ),
      ),
    );
  }
}
