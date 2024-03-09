import 'package:flutter/material.dart';

class FriendItem extends StatelessWidget {
  const FriendItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: Row(
        children: [
          Image.network(
            'abc',
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error);
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(5),
                  child: Align(
                    alignment: FractionalOffset.centerLeft,
                    child: Text(
                      'datadatadatadatadata',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
                Container(
                  color: Colors.red,
                  height: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
