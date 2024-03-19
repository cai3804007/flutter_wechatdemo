import 'package:flutter/material.dart';

import 'friend_data.dart';

class FriendItem extends StatelessWidget {
  Friends? friend;

  FriendItem({this.friend, super.key});

  // FriendItem(this.friend);

  @override
  Widget build(BuildContext context) {
    // print(friend.name);
    if (friend == null) {
      return Container();
    }
    return Container(
      height: 44,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: friend!.isLocal!
                  ? Image(
                      image: AssetImage(friend!.imageAssets!),
                    )
                  : Image.network(
                      friend!.imageUrl!,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error);
                      },
                    ),
            ),
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
                      friend!.name!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
                Container(
                  color: Colors.grey.shade200,
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
