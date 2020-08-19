import 'dart:js';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _pushSave() {
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (BuildContext context){
      //      final tiles  = _saved
      //   },)
      // );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.green.shade100,
      ),
      title: 'Welcome to flutter app',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to flutter app"),
          actions: [
            IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSave,
            ),
          ],
        ),
        body: RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(
    fontSize: 18.0,
  );
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 30; i++) {
      _suggestions.addAll(generateWordPairs().take(10));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildRow(WordPair pair) {
      final alreadySaved = _saved.contains(pair);
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
      );
    }

    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _suggestions.length,
        itemBuilder: (context, i) {
          return _buildRow(_suggestions[i]);
        });
  }
}
