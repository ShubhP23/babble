import 'package:flutter/material.dart';
import 'package:babble/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Flexible(
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
                  text: 'Log In',
                  textColour: Colors.black,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: RoundedButton(
                  colour: Colors.grey,
                  text: 'Register',
                  textColour: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
