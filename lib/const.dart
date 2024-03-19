import 'package:flutter/material.dart';

//主题色
const Color weChatThemeColor = Color.fromRGBO(220, 220, 220, 1.0);

//屏幕宽高
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

// 获取屏幕尺寸
double appBarHeight = AppBar().preferredSize.height; // 获取应用栏的高度
double statusBarHeight(BuildContext context) =>
    MediaQuery.of(context).padding.top; // 获取状态栏的高度

// 计算导航栏的高度（应用栏 + 状态栏）
double navigationBarHeight(BuildContext context) =>
    appBarHeight + statusBarHeight(context);
