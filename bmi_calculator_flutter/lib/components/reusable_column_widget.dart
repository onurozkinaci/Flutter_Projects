import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableColumnWidget extends StatelessWidget {
  final IconData iconData;
  final String label;
  ReusableColumnWidget({this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: kIconSize,
        ),
        SizedBox(height: kSizedBoxHeight),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
