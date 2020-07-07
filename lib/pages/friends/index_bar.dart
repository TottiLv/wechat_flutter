import 'package:flutter/material.dart';

import '../../consts.dart';
import 'friends_data.dart';
import 'friends_data.dart';

class IndexBar extends StatefulWidget {
  final void Function(String str) indexBarCallBack;
  IndexBar({this.indexBarCallBack});
  @override
  _IndexBarState createState() => _IndexBarState();
}

int getIndex(BuildContext context, Offset globalPosition){
  //坐标转换(通过：RenderBox 做坐标转换)
  RenderBox box = context.findRenderObject();
  //获取到当前小部件坐标（拿到y值）
  double y = box.globalToLocal(globalPosition).dy;
  //算出字符高度
  var itemHeight = ScreenHeight(context) / 2 / INDEX_WORDS.length;
  //算出选中的是第几个item,并且给一个取值范围clamp
  int index = (y ~/ itemHeight).clamp(0, INDEX_WORDS.length-1);
  return index;
}

class _IndexBarState extends State<IndexBar> {
  Color _bgColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;
  double _indicatorY = 0.0;
  String _indicatorText = "A";
  bool _indicatorHidden = true;
  @override
  Widget build(BuildContext context) {
    List<Widget> words = [];
    for(int i=0;i<INDEX_WORDS.length;i++){
      words.add(Expanded(
        child: Text(
          INDEX_WORDS[i],
          style: TextStyle(fontSize: 11, color: _textColor),
        ),
      ));
    }

    return Positioned(
      top: ScreenHeight(context)/8,
      height: ScreenHeight(context)/2,
      right: 0.0,
      width: 120,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment(0, _indicatorY),
            width: 100,
            child: _indicatorHidden ? null : Stack(
              alignment: Alignment(-0.2,0),//alignment字部件相对与父部件的
              children: <Widget>[
                Image(image: AssetImage("images/气泡.png"),width: 60,),
                Text(_indicatorText,style: TextStyle(fontSize: 25, color: Colors.white),),
              ],
            ),//气泡
          ),
          GestureDetector(
            //拖拽
            onVerticalDragUpdate: (DragUpdateDetails details){
              int index = getIndex(context, details.globalPosition);
              setState(() {
                _indicatorText = INDEX_WORDS[index];
                _indicatorY = 2.2/28*index-1.1;
                _indicatorHidden = false;
              });
              //传递事件给回调
              widget.indexBarCallBack(INDEX_WORDS[index]);
            },
            //点击
            onVerticalDragDown: (DragDownDetails details){
              int index = getIndex(context, details.globalPosition);
              widget.indexBarCallBack(INDEX_WORDS[index]);
              setState(() {
                _bgColor = Color.fromRGBO(1, 1, 1, 0.5);
                _textColor = Colors.white;
                _indicatorText = INDEX_WORDS[index];
                _indicatorY = 2.2/28*index-1.1;
                _indicatorHidden = false;
              });
            },

            onVerticalDragEnd: (DragEndDetails details){
              setState(() {
                _bgColor = Color.fromRGBO(1, 1, 1, 0);
                _textColor = Colors.black;
                _indicatorHidden = true;
              });
            },
            child: Container(
              color: _bgColor,
              child: Column(
                children: words,
              ),
            ),
          ),//这是索引条
        ],
      ),
    );
  }
}
