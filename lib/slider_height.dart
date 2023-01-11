import 'package:flutter/material.dart';

import 'constants.dart';

class Heightslider extends StatelessWidget {
  Heightslider({required this.height, required this.slide});
  final int height;
  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Height',
          style: kLabelTextStyle,
        ),

        Text(
          '$height cm',
          style: kNumberTextStyle,
        ),

        //slider

        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.grey.shade600,
              inactiveTrackColor: Colors.white,
              thumbColor: Color(0xFFE88100),
              overlayColor: Color(0xFF7a7a7a),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 25)),
          child: slide,
        ),

        //end slider
      ],
    );
  }
}
