import 'package:flutter/material.dart';

import 'constants.dart';

class Actionbutton extends StatelessWidget {
  Actionbutton({required this.onpress, required this.icon, this.btno});
  final void Function() onpress;
  final IconData icon;
  final btno;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onpress,
      backgroundColor: kFloatIconColor,
      heroTag: btno,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
