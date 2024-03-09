import 'package:flutter/material.dart';

//主题色
const Color weChatThemeColor = Color.fromRGBO(220, 220, 220, 1.0);

//屏幕宽高
double screenWidth(BuildContext context) =>
    MediaQuery
        .of(context)
        .size
        .width;

double screenHeight(BuildContext context) =>
    MediaQuery
        .of(context)
        .size
        .height;
