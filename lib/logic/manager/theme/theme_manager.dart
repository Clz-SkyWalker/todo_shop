import 'package:flutter/material.dart';
import '../../const/app_const.dart';
import 'colors/color_manager.dart';
import 'colors/kind/blue_color.dart';
import 'colors/kind/dark_color.dart';
import 'colors/kind/light_color.dart';
import 'text/kind/dark_text.dart';
import 'text/kind/light_text.dart';
import 'text/text_manager.dart';

abstract class ITheme {
  ITextManager get textTheme;

  IColorManager get colors;
}

abstract class IThemeManager {
  static ThemeData createTheme(ITheme theme) => ThemeData(
        useMaterial3: true,
        textTheme: theme.textTheme.data,
        colorScheme: theme.colors.colorScheme,
        fontFamily: theme.textTheme.fontFamily,
      );
}

ITheme switchTheme(int theme) {
  switch (theme) {
    case AppConst.themeBlue:
      return AppThemeBlue();
    case AppConst.themeLight:
      return AppThemeLight();
    case AppConst.themeDark:
      return AppThemeDark();
    default:
      return AppThemeLight();
  }
}

class AppThemeDark extends ITheme {
  @override
  late IColorManager colors;

  @override
  late ITextManager textTheme;

  AppThemeDark() {
    colors = DarkColors();
    textTheme = DarkText(colors.colors.mediumGrey);
  }
}

class AppThemeLight extends ITheme {
  @override
  late IColorManager colors;

  @override
  late ITextManager textTheme;

  AppThemeLight() {
    colors = LightColor();
    textTheme = LightText(colors.colors.darkerGrey);
  }
}

class AppThemeBlue extends ITheme {
  @override
  late IColorManager colors;

  @override
  late ITextManager textTheme;

  AppThemeBlue() {
    colors = BlueColor();
    textTheme = LightText(colors.colors.darkerGrey);
  }
}
