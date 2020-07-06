import 'package:flutter/material.dart';
import 'package:wechat_flutter/pages/discover/discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  String title;
  String imageName;
  String subTitle;
  String subImageName;

  DiscoverCell({
    this.title,
    this.imageName,
    this.subTitle,
    this.subImageName
  });

  @override
  _DiscoverCellState createState() => _DiscoverCellState();
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _currentColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context)=>DiscoverChildPage(title:widget.title))
        );
        setState(() {
          _currentColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails detail){
        setState(() {
          _currentColor = Colors.grey;
        });
      },
      onTapCancel: (){
        setState(() {
          _currentColor = Colors.white;
        });
      },

      child: Container(
        color: _currentColor,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //left
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage(widget.imageName),
                    width: 20,
                  ),
                  SizedBox(width: 15,),
                  Text(
                      widget.title
                  ),
                ],
              ),
            ),
            //right
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  widget.subTitle != null ? Text(widget.subTitle) : Text(''),
                  widget.subImageName != null ? Image(image: AssetImage(widget.subImageName),width: 12,) : Container(),
                  Image(image: AssetImage('images/icon_right.png'),width: 15,),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}

