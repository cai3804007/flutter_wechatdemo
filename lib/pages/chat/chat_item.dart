import 'package:flutter/material.dart';

class Chat {
  final String name;
  final String message;
  final String imageUrl;

  Chat({required this.name, required this.message, required this.imageUrl});
}

class ChatItem extends StatefulWidget {
  const ChatItem({super.key});

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 65,
      child: Row(
        children: [
          Container(
            color: Colors.red,
            child: const Image(
              image: AssetImage('assets//images/购物.png'),
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '这是一排姓名de',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '这是聊天的内容这是聊天的内容这是聊天的内容这是聊天的内容这是聊天的内容这是这是聊天的内容这是这是聊天的内容这是这是聊天的内容这是聊天的内容',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
