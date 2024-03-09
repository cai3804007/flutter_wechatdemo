import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat/chat_page.dart';
import 'package:wechat_demo/pages/discover/discover_page.dart';
import 'package:wechat_demo/pages/friends/friend_page.dart';
import 'package:wechat_demo/pages/mine_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final PageController _controller = PageController();
  final List<Widget> _pages = [
    const ChatPage(),
    const FriendPage(),
    const DiscoverPage(),
    const MinePage()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            print('点击了第$index个');
            _currentIndex = index;
            _controller.jumpToPage(_currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/tabbar_chat.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'assets/images/tabbar_chat_hl.png',
                width: 20,
                height: 20,
              ),
              label: '微信'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/tabbar_friends.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'assets/images/tabbar_friends_hl.png',
                width: 20,
                height: 20,
              ),
              label: '通讯录'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/tabbar_discover.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'assets/images/tabbar_discover_hl.png',
                width: 20,
                height: 20,
              ),
              label: '发现'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/tabbar_mine.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'assets/images/tabbar_mine_hl.png',
                width: 20,
                height: 20,
              ),
              label: '我'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        fixedColor: Colors.green,
      ),
    );
  }
}
