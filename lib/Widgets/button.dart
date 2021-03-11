import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key key, this.label, this.onPressed}) : super(key: key);
  final String label;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
