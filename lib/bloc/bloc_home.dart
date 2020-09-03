import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';

class BlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Counter"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.remove,
              ),
              onPressed: () {
                bloc.add(CounterEvent.remove);
              },
            ),
            BlocBuilder<CounterBloc, int>(builder: (context, state) {
              return Text(
                state.toString(),
                style: TextStyle(fontSize: 50),
              );
            }),
            IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () {
                bloc.add(CounterEvent.add);
              },
            )
          ],
        ),
      ),
    );
  }
}
