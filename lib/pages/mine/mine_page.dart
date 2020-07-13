import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wechat_flutter/pages/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  File _avataFile;

  void _pickImage() async {
    PickedFile file = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _avataFile = File(file.path);
    });
  }
  /*
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
  */

  Widget headerWidget (){
    return Container(
      color: Colors.white,
      height: 200,
      child: Container(
        margin: EdgeInsets.only(top: 100, bottom: 20),
        child: Container(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                margin: EdgeInsets.only(left: 10),
                /*
                //装饰器：添加圆角、边框、阴影等效果;
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                 */
                width: 50,
                height: 50,
                //如果是图片，需要把图片放入到decoration中
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: _avataFile == null ? AssetImage("images/lvjianxiong.png") : FileImage(_avataFile),fit: BoxFit.fill),
                ),
              ),),
              //头像

              //右侧
              Container(
                width: MediaQuery.of(context).size.width - 80,
                margin: EdgeInsets.only(top: 10,bottom: 10, right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text("吕建雄",textAlign: TextAlign.start, style: TextStyle(fontSize: 16),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("微信号:TottiLv",textAlign: TextAlign.start,style: TextStyle(fontSize: 14,color: Colors.grey),),
                          Image(image: AssetImage("images/icon_right.png"),width: 15,),
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //列表
          Container(
            color: Color.fromRGBO(220, 220, 220, 1.0),
            //MediaQuery.removePadding 可以移除上面导航栏
            child: MediaQuery.removePadding(removeTop: true, context: context, child: ListView(
              children: <Widget>[
                headerWidget(),
                SizedBox(height: 10,),
                DiscoverCell(title: "支付",imageName: "images/微信 支付.png",),
                SizedBox(height: 10,),
                DiscoverCell(title: "收藏",imageName: "images/微信收藏.png",),
                Row(
                  children: <Widget>[
                    //left
                    Container(width: 50, color: Colors.white,height: 0.5,),
                    Container(color: Colors.grey,height: 0.5,),
                    //right
                  ],
                ),
                DiscoverCell(title: "相册",imageName: "images/微信相册.png",),
                Row(
                  children: <Widget>[
                    //left
                    Container(width: 50, color: Colors.white,height: 0.5,),
                    Container(color: Colors.grey,height: 0.5,),
                    //right
                  ],
                ),
                DiscoverCell(title: "卡包",imageName: "images/微信卡包.png",),
                Row(
                  children: <Widget>[
                    //left
                    Container(width: 50, color: Colors.white,height: 0.5,),
                    Container(color: Colors.grey,height: 0.5,),
                    //right
                  ],
                ),
                DiscoverCell(title: "表情",imageName: "images/微信表情.png",),
                SizedBox(height: 10,),
                DiscoverCell(title: "设置",imageName: "images/微信设置.png",),
              ],
            ),),
          ),
          //相机
          Container(
            height: 25,
            margin: EdgeInsets.only(top: 40, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image(image: AssetImage("images/相机.png"),),
              ],
          ),),
        ],
      ),
    );
  }
}
