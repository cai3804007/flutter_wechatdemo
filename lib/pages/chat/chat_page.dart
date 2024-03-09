import 'package:flutter/material.dart';

import '../../const.dart';
import 'chat_item.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chat> chats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('聊天'),
        backgroundColor: weChatThemeColor,
      ),
      body: Container(
        color: weChatThemeColor,
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.red,
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: _buildListItem,
                    separatorBuilder: (context, index) {
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
                    },
                    itemCount: 5)),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return ChatItem();
  }
}
