import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.text, required this.sender, required this.isMe});
  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white24,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            elevation: 4.0,
            shadowColor: isMe ? Colors.white24 : Colors.grey,
            color: isMe ? Colors.black45 : Colors.black26,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
