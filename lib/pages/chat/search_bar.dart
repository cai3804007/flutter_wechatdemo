import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';

class WeCahtSearchBar extends StatelessWidget {
  final Function() onSearchClick;

  const WeCahtSearchBar(this.onSearchClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 50,
      color: weChatThemeColor,
      child: GestureDetector(
        onTap: () {
          onSearchClick();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/放大镜b.png',
                width: 20,
              ),
              SizedBox(width: 3),
              Text('搜索')
            ],
          ),
        ),
      ),
    );
  }
}
