import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rigthDiceNumber = 1;

  void changeDiceState() {
    setState((){
      leftDiceNumber = Random().nextInt(6) + 1;
      rigthDiceNumber = Random().nextInt(6) + 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceState(); //setState() triggered inside of this method.
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceState(); //setState() triggered inside of this method.
              },
              child: Image.asset('images/dice$rigthDiceNumber.png'),
            ),
          )
        ],
      ),
    );
  }
}

/*class DicePage extends StatelessWidget {
  //var leftDiceNumber = 5; burada tanimlarsan, build() icinde kullaniliyor olsa bile
  //Hot Reload ile yalnizca build()'deki degisiklikler takip edildiginden bu degiskenin
  //degerindeki degisiklik algilanmaz.
  @override
  Widget build(BuildContext context) {
    var leftDiceNumber = 5;
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                print('Left button is clicked!');
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                print('Right button is clicked!');
              },
              child: Image.asset('images/dice2.png'),
            ),
          )
        ],
      ),
    );
  }
}
*/
