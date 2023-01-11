import 'package:bmi_calulator/constants.dart';
import 'package:flutter/material.dart';

class Usablecard extends StatelessWidget {
  Usablecard({required this.cardChild});

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kActiveCardColour,
      ),
      child: cardChild,
    );
  }
}
