import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  //To reduce the repeated code, the below function will be used;
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource("note$soundNumber.wav"));
  }

  //To reduce the repeated code for creating the buttons-widgets;
  //=>name arguments(keywords) will be used while calling this function.
  Expanded buildKey({Color color, int soundNo}) {
    return Expanded(
      child: TextButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
          onPressed: () {
            playSound(soundNo);
          },
          child: Text(
            'Sound $soundNo',
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        //appBar: AppBar(backgroundColor: Colors.black45),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildKey(color: Colors.red, soundNo: 1),
              buildKey(color: Colors.orange, soundNo: 2),
              buildKey(color: Colors.yellow, soundNo: 3),
              buildKey(color: Colors.green, soundNo: 4),
              buildKey(color: Colors.teal, soundNo: 5),
              buildKey(color: Colors.blue, soundNo: 6),
              buildKey(color: Colors.purple, soundNo: 7),
            ],
          ),
        ),
      ),
    );
  }
}
