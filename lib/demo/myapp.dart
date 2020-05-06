

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../model/model.dart';

class Randomword extends StatefulWidget {
  @override
   createState() => Randomwordsstate();
}

class Randomwordsstate extends State<Randomword> {

  final _suggestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize: 18);

  final _saved = Set<WordPair>();

  Widget _buildSuggestions() {
    return new ListView.builder(

      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }


  Widget _buildRow(WordPair pair) {
    final alreadSaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style:_biggerFont,
      ),

      trailing:  Icon(
        alreadSaved ? Icons.favorite : Icons.favorite_border,
        color: alreadSaved ? Colors.red : null,
      ),
      
      onTap: () {
        print('点一下');
        setState(() {
          if (alreadSaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved () {

    DataModel model = DataModel('1', _saved);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Sclistwidget(model: model),
      )
    );
  }

  @override
  Widget build(BuildContext context) {    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

class Sclistwidget extends StatefulWidget {
  final DataModel model;
  Sclistwidget({Key key, @required this.model}) : super(key: key);

  @override
  _SclistwidgetState createState() => _SclistwidgetState();
}

class _SclistwidgetState extends State<Sclistwidget> {
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    final titles = widget.model.data.map(
      (pair) {
         return ListTile(
           title: Text(
             pair.asPascalCase,
             style: _biggerFont,
           ),
         ) ; 
      }
    );

    final divided = ListTile.divideTiles(
      context: context,
      tiles: titles,
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('收藏'),
      ), 
      body: ListView(children:divided)
    ); 
  }
}

