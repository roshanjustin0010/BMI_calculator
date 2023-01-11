import 'package:flutter/material.dart';

import 'constants.dart';

class Bottombutton extends StatelessWidget {
  const Bottombutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(bottom: 20.0),
      color: Color(0xFFE88100),
      height: kBottomContainerHeight,
      child: Center(
          child: Text(
        'CALCULATE',
        style: kLargeButtonTextStyle,
      )),
    );
  }
}
