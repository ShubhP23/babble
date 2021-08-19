import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(Babble());
}

class Babble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}
