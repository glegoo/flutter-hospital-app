import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  String dataDay;

  MessagePage({Key key, this.dataDay}) : super(key: key);

  MessagePageState createState() => new MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return new Column();
  }
}
