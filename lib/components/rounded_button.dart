import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  @override
  RoundedButton(
      {this.colour,
      required this.title,
      this.textColour,
      required this.onpress});
  final Color? colour;
  final String title;
  final Color? textColour;
  final Function() onpress;
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
          title,
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
