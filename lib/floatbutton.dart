import 'package:flutter/material.dart';

import 'constants.dart';

class Actionbutton extends StatelessWidget {
  Actionbutton({required this.onpress, required this.icon});
  final void Function() onpress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onpress,
      backgroundColor: kFloatIconColor,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
