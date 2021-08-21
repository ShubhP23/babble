import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:babble/constants.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Babble',
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                List<Text> messageWidgets = [];
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                final messages = snapshot.data!.docs;

                for (var message in messages) {
                  final messageText = (message.data() as Map)['text'];
                  final messageSender = (message.data() as Map)['sender'];

                  final messageWidget =
                      Text('$messageText from $messageSender');
                  messageWidgets.add(messageWidget);
                }

                return Column(
                  children: messageWidgets,
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Type a message...',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black38,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15.0),
                      elevation: 4.0,
                      shadowColor: Colors.grey,
                    ),
                    child: Icon(
                      Icons.send_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
