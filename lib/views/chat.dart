import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/widget.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
    );
  }
}
