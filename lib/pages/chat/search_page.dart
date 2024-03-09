import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat/chat_item.dart';

import '../../const.dart';
import 'chat_page.dart';

class SearchPage extends StatefulWidget {
  List<Chat> chats;

  SearchPage(this.chats);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();
  String currentString = '';
  List<Chat> searchList = [];
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
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            getSearchFile(context),
            Expanded(
              child: ListView.separated(
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
                  itemCount: searchList.length),
            ),
            searchList.length > 0
                ? getTitle(searchList.first.name)
                : SizedBox(
                    height: 10,
                  ),
          ],
        ),
      ),
    );
  }

  Widget getSearchFile(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.all(5),
      color: weChatThemeColor,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Image.asset(
              'assets/images/放大镜b.png',
              width: 15,
            ),
            Expanded(
              child: TextField(
                maxLines: 1,
                controller: _controller,
                onChanged: _onChange,
                cursorColor: Colors.green,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: '搜索',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 5, bottom: 10)),
              ),
            ),
            Container(
              // color: Colors.green,
              child: getClearType(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getClearType() {
    if (currentString.length > 0) {
      return GestureDetector(
        child: Icon(Icons.close),
        onTap: () {
          _controller.clear();
          _onChange("");
        },
      );
    }
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // 设置内边距为零
      ),
      child: Text(
        '取消',
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Chat chat = searchList[index];
    Widget rich = getTitle(chat.name);
    print('rich $rich');
    return ChatItem(
      chat,
      hightString: currentString,
    );
  }

  RichText getTitle(String name) {
    List<TextSpan> spans = [];

    List<String> strs = name.split(currentString);
    for (int i = 0; i < strs.length; i++) {
      String str = strs[i]; //拿出字符串
      if (str == '' && i < strs.length - 1) {
        spans.add(TextSpan(text: currentString, style: _highlightedStyle));
      } else {
        spans.add(TextSpan(text: str, style: _normalStyle));
        if (i < strs.length - 1) {
          spans.add(TextSpan(text: currentString, style: _highlightedStyle));
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

  void _onChange(String value) {
    searchList.clear();
    currentString = value;
    if (value.isEmpty) {
      print("value = $value" + "length =" + searchList.length.toString());
      setState(() {});
      return;
    }
    for (var o in widget.chats) {
      if (o.name.contains(value)) {
        searchList.add(o);
      }
    }
    setState(() {});
  }
}
