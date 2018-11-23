import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Startup Name',
      home: new RandomWords(),
    );

//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter~'),
//        ),
//        body: new Center(
//          child: new RandomWords(),
//        ),
//      ),
//    );
  }
}

class RandomWords extends StatefulWidget {

  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Startup Name"),
        ),
        body: _buildSuggestions(),
      );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        //每次生成一个单词时被回调

        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;

          if (index >= _suggestions.length) {
               _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair){
     return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
     );
  }
}


//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Our First Flutter app',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text("Flutter rolling demo"),
//        ),
//        body: Center(
//          child: RollingButton(),
//        ),
//      ),
//    );
//  }
//
//  void _onPressed() {
//    debugPrint('_onPressed');
//  }
//}
//
//class RollingButton extends StatefulWidget{
//
//  @override
//  State createState() {
//     return _RollingState();
//  }
//}
//
//class _RollingState extends State<RollingButton>{
//
//  final _random = Random();
//
//  List<int> _roll(){
//    final roll1 = _random.nextInt(6)+1;
//    final roll2 = _random.nextInt(6)+1;
//    return[roll1,roll2];
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return RaisedButton(
//      child: Text('Roll'),
//      onPressed: _onPressed,
//    );
//  }
//
//  void _onPressed() {
//    debugPrint('_RollingState._onPressed');
//
//    final rollResults = _roll();
//
//    showDialog(
//      // 第一个 context 是参数名，第二个 context 是 State 的成员变量
//        context: context,
//        builder: (_) {
//          return AlertDialog(
//            content: Text('Roll result:(${rollResults[0]}),(${rollResults[1]})'),
//          );
//        }
//    );
//  }
//}

