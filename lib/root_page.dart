import 'package:flutter/material.dart';
import 'package:wechat_flutter/pages/chat_page.dart';
import 'package:wechat_flutter/pages/discover/discover_page.dart';
import 'package:wechat_flutter/pages/friends/friends_page.dart';
import 'package:wechat_flutter/pages/mine/mine_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 1;
  List<Widget> _pages = [ChatPage(), FriendsPage(),DiscoverPage(),MinePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      //BottomNavigationBar的使用，需要设置type
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        onTap: (index) {
          setState(() {
            _currentIndex= index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('images/tabbar_chat.png',height: 20, width: 20,),
              activeIcon: Image.asset('images/tabbar_chat_hl.png',height: 20, width: 20,),
              title: Text("微信")),
          BottomNavigationBarItem(
              icon: Image.asset('images/tabbar_friends.png', width: 20, height: 20,),
              activeIcon: Image.asset('images/tabbar_friends_hl.png',width: 20, height: 20,),
              title: Text("通讯录")),
          BottomNavigationBarItem(
              icon: Image.asset('images/tabbar_discover.png', width: 20, height: 20,),
              activeIcon: Image.asset('images/tabbar_discover_hl.png',width: 20, height: 20,),
              title: Text("发现")),
          BottomNavigationBarItem(
              icon: Image.asset('images/tabbar_mine.png', width: 20, height: 20,),
              activeIcon: Image.asset('images/tabbar_mine_hl.png',width: 20, height: 20,),
              title: Text("我"))
        ],
      ),
    );
  }
}

