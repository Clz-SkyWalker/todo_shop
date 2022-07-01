import 'package:flutter/material.dart';
import 'package:todo_shop/logic/const/app_const.dart';
import 'package:todo_shop/logic/manager/theme/colors/color_manager.dart';
import 'package:todo_shop/logic/manager/theme/colors/kind/blue_color.dart';
import 'package:todo_shop/logic/manager/theme/colors/kind/dark_color.dart';
import 'package:todo_shop/logic/manager/theme/colors/kind/light_color.dart';
import 'package:todo_shop/logic/manager/theme/text/kind/dark_text.dart';
import 'package:todo_shop/logic/manager/theme/text/kind/light_text.dart';
import 'package:todo_shop/logic/manager/theme/text/text_manager.dart';

abstract class ITheme {
  ITextManager get textTheme;

  IColorManager get colors;
}

abstract class IThemeManager {
  static ThemeData createTheme(ITheme theme) => ThemeData(
        useMaterial3: true,
        // primaryColor: theme.colors.primaryColor,
        // switchTheme: SwitchThemeData(),
        // primarySwatch: ,
        textTheme: theme.textTheme.data,
        // cardColor: theme.colors.colorScheme?.onSecondary,
        // bottomAppBarColor: theme.colors.scaffoldBackgroundColor,
        // tabBarTheme: TabBarTheme(
        //   indicator: const BoxDecoration(),
        //   labelColor: theme.colors.appBarColor,
        //   unselectedLabelColor: theme.colors.tabBarNormalColor,
        // ),
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //     foregroundColor: theme.colors.colors.white,
        //     backgroundColor: theme.colors.colors.mediumGreyBold),
        // appBarTheme: AppBarTheme(backgroundColor: theme.colors.appBarColor),
        // navigationBarTheme: NavigationBarThemeData(
        //     backgroundColor: theme.colors.colorScheme!.onSecondary,
        //     iconTheme: MaterialStateProperty.resolveWith((states) {
        //       if (states.contains(MaterialState.selected)) {
        //         return IconThemeData(color: theme.colors.colorScheme!.primary);
        //       }
        //       return IconThemeData(color: theme.colors.colorScheme!.onSurface);
        //     })),
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
