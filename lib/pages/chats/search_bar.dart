import 'package:flutter/material.dart';
import 'package:wechat_flutter/consts.dart';

class SearchCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 34,
        color: WeChatThemeColor,
      ),
    );
  }
}
