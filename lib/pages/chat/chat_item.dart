import 'package:flutter/material.dart';

import 'chat_page.dart';

class ChatItem extends StatelessWidget {
  final Chat chat;

  String? hightString;

  ChatItem(this.chat, {this.hightString});

  // ChatItem(this.chat,this.hightString {Key? key});
  TextStyle _normalStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  TextStyle _highlightedStyle = TextStyle(
    fontSize: 16,
    color: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      color: Colors.white,
      height: 65,
      child: Row(
        children: [
          Container(
            // color: Colors.red,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5), // 设置圆角半径为 5
              child: Image(
                image: NetworkImage(chat.imageUrl),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Icon(Icons.error); // 加载失败时显示错误图标
                },
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hightString != null
                    ? getTitle(chat.name)
                    : Text(
                        chat.name,
                        style: TextStyle(fontSize: 14),
                      ),
                Text(
                  chat.message,
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

  RichText getTitle(String name) {
    List<TextSpan> spans = [];

    List<String> strs = name.split(hightString!);
    for (int i = 0; i < strs.length; i++) {
      String str = strs[i]; //拿出字符串
      if (str == '' && i < strs.length - 1) {
        spans.add(TextSpan(text: hightString, style: _highlightedStyle));
      } else {
        spans.add(TextSpan(text: str, style: _normalStyle));
        if (i < strs.length - 1) {
          spans.add(TextSpan(text: hightString, style: _highlightedStyle));
        }
      }
    }
    return RichText(
      text: TextSpan(children: spans),
    );
    // String text = currentString;
    // String pattern = name;
    // List<TextSpan> spans = [];
    // RegExp regExp = RegExp(pattern);
    // Iterable<RegExpMatch> matches = regExp.allMatches(text);
    // int lastMatchEnd = 0;
    //
    // for (RegExpMatch match in matches) {
    //   if (match.start > lastMatchEnd) {
    //     spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
    //   }
    //   spans.add(TextSpan(
    //     text: text.substring(match.start, match.end),
    //     style: TextStyle(color: Colors.blue), // 设置匹配到的部分为蓝色
    //   ));
    //   lastMatchEnd = match.end;
    // }
    // if (lastMatchEnd < text.length) {
    //   spans.add(TextSpan(text: text.substring(lastMatchEnd)));
    // }
    // return RichText(text: TextSpan(children: spans));
  }
}
