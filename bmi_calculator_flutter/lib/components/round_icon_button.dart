import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;

  //the function will be sent as a parameter (as a first-order object).
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0, //adds shadow around the button
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 40.0, height: 40.0),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
