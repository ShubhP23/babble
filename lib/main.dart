import 'package:babble/screens/log_in.dart';
import 'package:babble/screens/register.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'package:babble/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
