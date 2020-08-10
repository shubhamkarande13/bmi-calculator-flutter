import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  @override
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      focusElevation: 6,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      elevation: 0.0,
    );
  }
}
