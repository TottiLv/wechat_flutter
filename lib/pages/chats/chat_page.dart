import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wechat_flutter/consts.dart';
import 'package:wechat_flutter/pages/chats/search_bar.dart';
import 'package:wechat_flutter/tools/http_manager.dart';



class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin {

  List<Chat> _datas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData().then((List<Chat> datas) {
        setState(() {
          _datas = datas;
        });
    }).catchError((onError){

    }).whenComplete(() {

    });
//        .timeout(Duration(seconds: 6))
//    .catchError((timeout) {
//      _cancelConnect = true;
//      print('超时输出:$timeout');
//    });
  }

  Future<List<Chat>> getData() async{
    final response = await get("http://rap2.taobao.org:38080/app/mock/260290/api/chat/list",timeOut: 100);
    if (response.statusCode == 200){
      //获取相应数据，并转成Map
//      final responseMap = json.decode(response.body);
      //转模型数组
      List<Chat> chatList = response.data["chat_list"].map<Chat>((item){
        return Chat.fromJson(item);
      }).toList();
      return chatList;
    }else{
      throw Exception('statusCode:${response.statusCode}');
    }
  }

  Widget _buildPopumenuItem(String imageUrl, String title){
    return Row(
      children: <Widget>[
        Image(image: AssetImage(imageUrl), width: 20,),
        Container(width: 20,),
        Text(title, style: TextStyle(color: Colors.white),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,//导航栏底部横条
        backgroundColor: WeChatThemeColor,
        title: Text("微信页面"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              offset: Offset(0, 65),
              child: Image(image: AssetImage("images/圆加.png"),width: 25,),
              itemBuilder: (BuildContext context){
                return  <PopupMenuItem<String>> [
                  PopupMenuItem(child: _buildPopumenuItem("images/发起群聊.png", "发起群聊"),),
                  PopupMenuItem(child: _buildPopumenuItem("images/添加朋友.png", "添加朋友"),),
                  PopupMenuItem(child: _buildPopumenuItem("images/扫一扫1.png", "扫一扫"),),
                  PopupMenuItem(child: _buildPopumenuItem("images/收付款.png", "收付款"),),
                ];
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: _datas.length == 0 ?
        Center(child: Text("Loading..."),) :
        ListView.builder(
        itemCount: _datas.length,
        itemBuilder: _buildCellForRow,
      ),
      ),
    );
  }
  //聊天CELL
  Widget _buildCellForRow(BuildContext context, int index) {
//    if (index == 0 ){
//      return SearchCell();
//    }
    //保证从模型数组中正确取出数据
//    index--;
        return ListTile(
            title: Text(_datas[index].name),
            subtitle: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(right: 10),
              height: 25,
              child: Text(
                _datas[index].message,
                overflow: TextOverflow.ellipsis,//overflow用来显示后面...
              ),
            ),
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  image: DecorationImage(
                      image: NetworkImage(_datas[index].imageUrl))),
            ));
      }

  @override
  // TODO: implement wantKeepAlive
//  bool get wantKeepAlive => throw UnimplementedError();
  bool get wantKeepAlive => true;
}


class Chat {
  final String imageUrl;
  final String name;
  final String message;
  const Chat({this.imageUrl, this.name,this.message});

  factory Chat.fromJson(Map json) {
    return Chat(
      name: json['name'],
      message: json['message'],
      imageUrl: json['imageUrl'],
    );
  }
}