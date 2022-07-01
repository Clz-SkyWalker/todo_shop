import 'package:flutter/material.dart';

@immutable
class AppColors {
  // 马尔斯绿主题
  final Color marsThemeGreen = const Color.fromRGBO(1, 143, 144, 1);
  final Color marsThemeGrey = const Color.fromRGBO(160, 160, 160, 1);

  final Color white = const Color(0xffffffff);
  final Color green = const Color(0xff7bed8d);
  final Color lightBlue = Colors.lightBlue;
  final Color mediumGrey = const Color(0xffa6bcd0);
  final Color mediumGreyBold = const Color(0xff748a9d);
  final Color lighterGrey = const Color(0xfff0f4f8);
  final Color lightGrey = const Color(0xffdbe2ed);
  final Color darkerGrey = const Color(0xff404e5a);
  final Color darkGrey = const Color(0xff4e5d6a);

  final Color lightPrimary = const Color.fromRGBO(244, 247, 255, 1);
  final Color darkPrimary = const Color.fromRGBO(244, 247, 255, 1);
}

abstract class IColorManager {
  AppColors get colors;

  Color? primaryColor;
  Color? scaffoldBackgroundColor;
  Color? appBarColor;
  Color? tabBarColor;
  Color? tabBarSelectedColor;
  Color? tabBarNormalColor;
  Brightness? brightness;

  ColorScheme? colorScheme;
}
