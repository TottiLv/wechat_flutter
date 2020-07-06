import 'package:flutter/material.dart';
import 'package:wechat_flutter/pages/discover/discover_child_page.dart';
import 'package:wechat_flutter/pages/friends/index_bar.dart';
import 'friends_data.dart';
import 'package:wechat_flutter/consts.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {

  final List<Friends> _listDatas = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listDatas.addAll(datas);
    _listDatas.addAll(datas);
//    _listDatas..addAll(datas);
    //排序
    _listDatas.sort((Friends a, Friends b) => a.indexLetter.compareTo(b.indexLetter) );
  }

  final headerModel = [Friends(name: "新的朋友",imageUrl: "images/新的朋友.png"),
    Friends(name: "群聊",imageUrl: "images/群聊.png"),Friends(name: "标签",imageUrl: "images/标签.png"),
    Friends(name: "公众号",imageUrl: "images/公众号.png")];

  Widget _itemForRow(BuildContext context, int index){
    if (index < headerModel.length){
      return _FriendsCell(name: headerModel[index].name,imageAssets: headerModel[index].imageUrl,);
    }

    bool flag = (index -4 > 0 && _listDatas[index-4].indexLetter==_listDatas[index-5].indexLetter);
    return _FriendsCell(
        name: _listDatas[index-4].name,
        imageUrl: _listDatas[index-4].imageUrl,
         groupTitle:  flag == true ? null : _listDatas[index-4].indexLetter,
      );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeChatThemeColor,
        title: Text("通讯录页面"),
        //AppBar里面的actions属性，用来增加导航条的按钮
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=>DiscoverChildPage(title: "通讯录",)),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image(image: AssetImage("images/icon_friends_add.png"),),
              width: 25,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: WeChatThemeColor,
            child: ListView.builder(
                itemCount: headerModel.length + _listDatas.length,
                itemBuilder: _itemForRow),
          ),
          IndexBar(),//悬浮控件(索引)
        ],
      ),
      /*
      body: Container(
        color: WeChatThemeColor,
        child: ListView.builder(
            itemCount: headerModel.length + _listDatas.length,
            itemBuilder: _itemForRow),
      ),
       */
    );
  }
}

class _FriendsCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets;
  //super是调用父类
  const _FriendsCell({Key key, this.imageUrl, this.name, this.groupTitle, this.imageAssets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10),
          height:  groupTitle != null ? 30 : 0,
          color: Color.fromRGBO(1, 1, 1, 0.0),
          child: groupTitle != null ? Text(groupTitle,style: TextStyle(color: Colors.grey),) : null,
        ),//cell的头(思路：每个cell全部给添加一个头，然后根据groupTitle进行隐藏)
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  image: DecorationImage(image: imageUrl != null ? NetworkImage(imageUrl) : AssetImage(imageAssets)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(name, style: TextStyle(fontSize: 16, color: Colors.black),),
              )
            ],
          ),
        ),
        Container(
          height: 0.5,
          color: WeChatThemeColor,
          child: Row(
            children: <Widget>[
              Container(
                width: 44,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
