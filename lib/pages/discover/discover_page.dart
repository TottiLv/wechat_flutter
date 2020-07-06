import 'package:flutter/material.dart';
import 'package:wechat_flutter/consts.dart';
import 'discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  Color _themeColor = Color.fromRGBO(220, 220, 220, 1.0);
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget._themeColor,
        centerTitle: true,
        title: Text("发现页面"),
        elevation: 0.0,//底步边栏
      ),
      body: Container(
        color: widget._themeColor,
        height: 800,
        child: ListView(
          children: <Widget>[
            DiscoverCell(imageName: "images/朋友圈.png",title: "朋友圈",),
            SizedBox(height: 15,),
            DiscoverCell(imageName: "images/扫一扫.png", title: "扫一扫",),
            Row(
              children: <Widget>[
                //left
                Container(width: 50, color: Colors.white,height: 0.5,),
                Container(color: Colors.grey,height: 0.5,),
                //right
              ],
            ),
            DiscoverCell(imageName: "images/摇一摇.png", title: "摇一摇",),
            SizedBox(height: 15,),
            DiscoverCell(imageName: "images/看一看icon.png", title: "看一看",),
            Row(
              children: <Widget>[
                //left
                Container(width: 50, color: Colors.white,height: 0.5,),
                Container(color: Colors.grey,height: 0.5,),
                //right
              ],
            ),
            DiscoverCell(imageName: "images/搜一搜.png", title: "搜一搜",),
            SizedBox(height: 15,),
            DiscoverCell(imageName: "images/附近的人icon.png", title: "附近的人",),
            SizedBox(height: 15,),
            DiscoverCell(imageName: "images/购物.png", title: "购物",
              subTitle: "618限时特购",subImageName: "images/badge.png",),
            Row(
              children: <Widget>[
                //left
                Container(width: 50, color: Colors.white,height: 0.5,),
                Container(color: Colors.grey,height: 0.5,),
                //right
              ],
            ),
            DiscoverCell(imageName: "images/游戏.png", title: "游戏",),
            SizedBox(height: 15,),
            DiscoverCell(imageName: "images/小程序.png", title: "小程序",),
          ],
        )
      ),
    );
  }
}

