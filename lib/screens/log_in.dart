import 'package:babble/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:babble/constants.dart';
import 'package:babble/components/rounded_button.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

class LogInScreen extends StatefulWidget {
  static const String id = 'logInScreen';
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
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
            Hero(
              tag: 'splash',
              child: Container(
                height: 110.0,
                child: Image.asset('assets/splashScreen1.png'),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
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
                title: 'Log In',
                onpress: () async {
                  // setState(() {
                  //   showSpinner = true;
                  // });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    // setState(() {
                    //   showSpinner = false;
                    // });
                  } catch (e) {
                    print(e);
                  }
                })
          ],
        ),
      ),
    );
  }
}
