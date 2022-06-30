import 'package:flutter/material.dart';
import 'package:todo_shop/logic/manager/theme/colors/color_manager.dart';

class DarkColors implements IColorManager {
  @override
  final AppColors colors = AppColors();
  @override
  Color? primaryColor;

  @override
  ColorScheme? colorScheme;

  @override
  Brightness? brightness;

  @override
  Color? appBarColor;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabBarNormalColor;

  @override
  Color? tabBarSelectedColor;

  DarkColors() {
    primaryColor = colors.darkPrimary;
    appBarColor = colors.darkGrey;
    scaffoldBackgroundColor = colors.darkGrey;
    tabBarColor = colors.green;
    tabBarNormalColor = colors.lighterGrey;
    tabBarSelectedColor = colors.green;
    colorScheme = const ColorScheme.dark()
        .copyWith(onPrimary: colors.green, onSecondary: colors.darkGrey);
    brightness = Brightness.dark;
  }
}
