import 'package:babble/screens/log_in.dart';
import 'package:babble/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:babble/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: RoundedButton(
                colour: Colors.blueGrey[50],
                title: 'Log In',
                textColour: Colors.black,
                onpress: () {
                  Navigator.pushNamed(context, LogInScreen.id);
                },
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: RoundedButton(
                colour: Colors.grey,
                title: 'Register',
                textColour: Colors.white,
                onpress: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
