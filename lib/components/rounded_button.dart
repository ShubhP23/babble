import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  @override
  RoundedButton({this.colour, this.text, this.textColour, this.onpress});
  final Color? colour;
  final String? text;
  final Color? textColour;
  final Function()? onpress;
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(30.0),
      color: colour,
      child: MaterialButton(
        minWidth: 200.0,
        height: 20.0,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 20.0,
            color: textColour,
          ),
        ),
        onPressed: onpress,
      ),
    );
  }
}
