import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: HexColor(
          "#171f21"), //HexColor is used by importing the 'hexcolor' library in pubspec.yaml.
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Center(child: Text('I Am Poor')),
      ),
      body: const Center(
        child: Image(
          image: AssetImage('images/stone.jpg'),
        ),
      ),
    ),
  ));
}
