import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'app_theme.dart';

class ThemeMaiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Theme Example",
              theme: AppTheme.lightTheme,
              themeMode:
                  appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
              darkTheme: AppTheme.darkTheme,
              home: TaskPage());
        },
      ),
    );
  }
}

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: Icon(Icons.menu),
        ),
        title: Text("Theme"),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 32),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Today", style: Theme.of(context).textTheme.headline1),
            Icon(Icons.add_circle_outline)
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              leading: Icon(
                Icons.call,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                "Conference Call",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle: Text(
                "30 mins",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(children: [
            Text("Dark Mode", style: Theme.of(context).textTheme.bodyText1),
            Spacer(),
            Switch(
              value: Provider.of<AppState>(context).isDarkModeOn,
              onChanged: (newValue) {
                Provider.of<AppState>(context, listen: false)
                    .updateTheTheme(newValue);
              },
            )
          ]),
        )
      ]),
    );
  }
}
