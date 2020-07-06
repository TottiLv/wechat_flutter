import 'package:flutter/material.dart';
import 'package:wechat_flutter/consts.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeChatThemeColor,
        title: Text("微信页面"),
      ),
      body: Center(
        child: Text("微信界面"),
      ),
    );
  }
}
