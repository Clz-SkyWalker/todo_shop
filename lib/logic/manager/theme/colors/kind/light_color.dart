import 'package:flutter/material.dart';
import 'package:todo_shop/logic/manager/theme/colors/color_manager.dart';

class LightColor implements IColorManager {
  @override
  Color? primaryColor;

  @override
  Color? appBarColor;

  @override
  Brightness? brightness;

  @override
  ColorScheme? colorScheme;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabBarNormalColor;

  @override
  Color? tabBarSelectedColor;

  @override
  final AppColors colors = AppColors();

  LightColor() {
    primaryColor=colors.lightPrimary;
    appBarColor = colors.lightBlue;
    scaffoldBackgroundColor = colors.white;
    tabBarColor = appBarColor;
    tabBarNormalColor = colors.darkerGrey;
    tabBarSelectedColor = colors.green;
    colorScheme = const ColorScheme.light().copyWith(
        onPrimary: colors.green,
        onSecondary: colors.white,
        onSurface: colors.mediumGreyBold);
    brightness = Brightness.light;
  }
}
