import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our First Flutter app',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter rolling demo"),
        ),
        body: Center(
          child: RollingButton(),
        ),
      ),
    );
  }

  void _onPressed() {
    debugPrint('_onPressed');
  }
}

class RollingButton extends StatefulWidget{

  @override
  State createState() {
     return _RollingState();
  }
}

class _RollingState extends State<RollingButton>{

  final _random = Random();

  List<int> _roll(){
    final roll1 = _random.nextInt(6)+1;
    final roll2 = _random.nextInt(6)+1;
    return[roll1,roll2];
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Roll'),
      onPressed: _onPressed,
    );
  }

  void _onPressed() {
    debugPrint('_RollingState._onPressed');

    final rollResults = _roll();

    showDialog(
      // 第一个 context 是参数名，第二个 context 是 State 的成员变量
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text('Roll result:(${rollResults[0]}),(${rollResults[1]})'),
          );
        }
    );
  }
}

