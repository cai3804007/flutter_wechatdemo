import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/pages/friends/search_index.dart';

import 'friend_data.dart';
import 'friend_item.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage>
    with AutomaticKeepAliveClientMixin {
  final List<Friends> _headerData = [
    Friends(imageAssets: 'assets/images/新的朋友.png', name: '新的朋友', isLocal: true),
    Friends(imageAssets: 'assets/images/群聊.png', name: '群聊', isLocal: true),
    Friends(imageAssets: 'assets/images/标签.png', name: '标签', isLocal: true),
    Friends(imageAssets: 'assets/images/公众号.png', name: '公众号', isLocal: true)
  ];

  final List<Friends> _listDatas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas.sort((a, b) => a.indexLetter!.compareTo(b.indexLetter!));
    _listDatas
      ..addAll(_headerData)
      ..addAll(datas);
    print('数组长度为' + _listDatas.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的'),
          backgroundColor: weChatThemeColor,
          scrolledUnderElevation: 0.0,
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: itemBuilder,
              itemCount: _listDatas.length,
            ),
            Positioned(top: 0, right: 0, child: SearchIndex(clickIndexBar))
          ],
        ));
  }

  clickIndexBar(String string) {}

  Widget? itemBuilder(BuildContext context, int index) {
    Friends friend = _listDatas[index];
    // Friends friended = _listDatas[index - 4];
    //是否显示组名字！
    bool _hiddenIndexLetter = (index - 4 > 0 &&
        _listDatas[index - 4].indexLetter == _listDatas[index - 5].indexLetter);
    if (_hiddenIndexLetter || index < 4) {
      return FriendItem(friend: friend);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
          width: screenWidth(context),
          alignment: Alignment.centerLeft,
          color: Colors.grey.shade200,
          padding: EdgeInsets.only(left: 10),
          child: Text(
            friend.indexLetter!,
          ),
        ),
        FriendItem(friend: friend),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
