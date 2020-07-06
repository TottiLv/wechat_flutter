import 'package:flutter/material.dart';

import '../../consts.dart';
import 'friends_data.dart';

class IndexBar extends StatefulWidget {
  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> words = [];
    for(int i=0;i<INDEX_WORDS.length;i++){
      words.add(Expanded(
        child: Text(
          INDEX_WORDS[i],
          style: TextStyle(fontSize: 11, color: Colors.grey),
        ),
      ));
    }

    return Positioned(
      top: ScreenHeight(context)/8,
      height: ScreenHeight(context)/2,
      right: 0.0,
      child: Column(
        children: words,
      ),
    );
  }
}
