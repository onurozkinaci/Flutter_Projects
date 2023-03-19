import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner:
          false, //to delete the 'debug' banner on emulator
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: const Center(
            child: Text("I Am Rich"),
          ),
        ),
        body: const Center(
          child: Image(image: AssetImage('images/diamond.png')),
        ),
      ),
    ),
  );
}
