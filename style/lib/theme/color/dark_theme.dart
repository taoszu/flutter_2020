import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:style/theme/color/base_theme.dart';

class DarkTheme extends BaseTheme {
  @override
  Color get appBgColor => Color(0XFF25253d);

  @override
  Color get mainBgColor => Color(0XFF2B2B4D);

  @override
  Color get primaryFontColor => Color(0XFFFFFFFF);

  @override
  Color get themeColor => Color(0XFF617BFF);

  @override
  Color get appBarFontColor => Color(0XFFFFFFFF);

}

final darkThemeData = BaseTheme.genThemeData(true);
