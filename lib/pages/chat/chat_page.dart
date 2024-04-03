import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat/search_bar.dart';
import 'package:wechat_demo/pages/chat/search_page.dart';
import 'package:wechat_demo/tools/http_manager.dart';

import '../../const.dart';
import 'chat_item.dart';

class Chat {
  final String name;
  final String message;
  final String imageUrl;

  Chat({required this.name, required this.message, required this.imageUrl});

  factory Chat.fromMap(Map map) {
    return Chat(
        name: map['name'], message: map['message'], imageUrl: map['imageUrl']);
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin<ChatPage> {
  List<Chat> chats = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("首次来了");
    getData().then((List<Chat> data) {
      if (data.isNotEmpty) {
        setState(() {
          chats = data;
          print(chats.length);
        });
      }
    });
  }

  Future<List<Chat>> getData() async {
    var response = await HttpManager.getData(
        'http://rap2api.taobao.org/app/mock/256798/api/chat/list');
    if (response.statusCode == 200) {
      List datas = response.data['chat_list'];
      List<Chat> chats = datas.map((item) => Chat.fromMap(item)).toList();
      return chats;
    } else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('聊天'),
          backgroundColor: weChatThemeColor,
          scrolledUnderElevation: 0.0),
      body: ListView.separated(
          itemBuilder: _buildListItem,
          separatorBuilder: (context, index) {
            if (index != 0) {
              return const Column(
                children: [
                  Divider(
                    height: 0.5,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              );
            } else {
              return Container(
                color: Colors.red,
                height: 0.5,
              );
            }
          },
          itemCount: chats.length + 1),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    if (index == 0) {
      return WeCahtSearchBar(() {
        print('搜索点击');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return SearchPage(chats);
        }));
      });
    }
    return ChatItem(chats[index]);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
