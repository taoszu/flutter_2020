import 'dart:ui';

import 'package:flutter/material.dart';

import '../global_theme.dart';

abstract class BaseTheme {

  Color get themeColor;

  Color get appBarFontColor;

  Color get appBgColor;

  Color get mainBgColor;

  Color get primaryFontColor;


  // 生成主题的配色
  static genThemeData(bool isDark) {
    final theme = isDark ? GlobalTheme.dark : GlobalTheme.light;
    return ThemeData(
        scaffoldBackgroundColor: theme.appBgColor,
        appBarTheme: AppBarTheme(
          // 状态栏字体图标颜色
          brightness: isDark ? Brightness.dark : Brightness.light,
          color: theme.mainBgColor,
          iconTheme: IconThemeData(color: theme.appBarFontColor, size: 12),
          textTheme: TextTheme(
              title: TextStyle(color: theme.appBarFontColor, fontSize: 17)),
        ));
  }
}
