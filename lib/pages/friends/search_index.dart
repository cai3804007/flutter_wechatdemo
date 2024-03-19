import 'package:flutter/material.dart';

import '../../const.dart';

class SearchIndex extends StatefulWidget {
  Function(String str) indexBarCallBack;

  SearchIndex(this.indexBarCallBack, {super.key});

  @override
  State<SearchIndex> createState() => _SearchIndexState();
}

class _SearchIndexState extends State<SearchIndex> {
  @override
  final List<Widget> words = [];
  String _currentText = 'A';
  double _indicatorY = 0.0;
  bool _isShowIndex = true;
  Offset _offset = Offset(0, 20);

  Widget build(BuildContext context) {
    words.clear();
    for (var i = 0; i < INDEX_WORDS.length; ++i) {
      var o = INDEX_WORDS[i];
      words.add(GestureDetector(
        onVerticalDragDown: (DragDownDetails details) {
          setState(() {
            print('local Postion $details');
            // 获取点击目标组件的位置信息
            RenderBox box = context.findRenderObject() as RenderBox;
            Offset offset = box.localToGlobal(Offset.zero);
            _offset = Offset(
                0, details.globalPosition.dy - screenHeight(context) / 8);
          });
        },
        child: Text(
          o,
          style: const TextStyle(fontSize: 10),
        ),
      ));
    }
    print(words.length);
    return Row(
      children: [
        _isShowIndex
            ? Container(
                color: Colors.grey,
                width: 80,
                height: screenHeight(context),
                child: Stack(
                  children: [
                    Positioned(
                      left: 15,
                      top: _offset.dy,
                      child: Image(
                        image: AssetImage('assets/images/气泡.png'),
                        width: 60,
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: _offset.dy,
                      child: Text(
                        _currentText,
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            : SizedBox(
                width: 60,
              ),
        Container(
          width: 20,
          padding: EdgeInsets.only(
              top: screenHeight(context) / 8,
              bottom: screenHeight(context) / 8),
          color: Colors.red,
          height: screenHeight(context),
          child: Column(
            children: words,
          ),
        ),
      ],
    );
  }
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
