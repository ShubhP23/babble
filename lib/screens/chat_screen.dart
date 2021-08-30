import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:babble/constants.dart';
import 'package:babble/components/message_bubbles.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messageText;

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
        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
        title: Text(
          'Babble',
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStream(),
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
                  SizedBox(
                    width: 4.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: textController,
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
                      textController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser!.email,
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
            SizedBox(
              height: 4.0,
            )
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;

        for (var message in messages) {
          final messageText = (message.data() as Map)['text'];
          final messageSender = (message.data() as Map)['sender'];
          final currentUser = loggedInUser!.email;

          final messageBubble = MessageBubble(
            text: messageText,
            sender: messageSender,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
