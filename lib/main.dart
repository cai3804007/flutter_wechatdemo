import 'package:flutter/material.dart';
import 'package:wechat_demo/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "微信",
      theme: ThemeData(
        highlightColor: const Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: const Color.fromRGBO(1, 0, 0, 0.0),
        primaryColor: Colors.grey,
      ),
      home: const RootPage(),
    );
  }
}

