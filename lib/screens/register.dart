import 'package:babble/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:babble/constants.dart';
import 'package:babble/components/rounded_button.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'registerScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  // bool showSpinner = false;
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
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
            ),
            SizedBox(
              height: 15.0,
            ),
            RoundedButton(
              title: 'Register',
              onpress: () async {
                // setState(() {
                //   showSpinner = true;
                // });
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  // setState(() {
                  //   showSpinner = false;
                  // });
                } catch (e) {
                  print(e);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
