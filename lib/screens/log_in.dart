import 'package:flutter/material.dart';
import 'package:babble/constants.dart';

class LogInScreen extends StatefulWidget {
  static const String id = 'logInScreen';
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Babble',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              onChanged: (value) {},
              decoration: kTextFieldDecoration,
            ),
          ],
        ),
      ),
    );
  }
}
