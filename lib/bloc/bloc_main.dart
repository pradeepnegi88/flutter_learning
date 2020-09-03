import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/counter_bloc.dart';
import 'bloc_home.dart';

class BlocMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.teal.shade200.withBlue(20),
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(0),
        child: BlocHome(),
      ),
    );
  }
}
