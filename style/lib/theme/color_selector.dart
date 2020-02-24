import 'dart:ui';

import 'package:flutter/material.dart';

import 'global_theme.dart';


class ColorSelector {
  final Color light;
  final Color dark;

  ColorSelector(this.light, this.dark);

  get color => GlobalTheme.isDark ? dark : light;

}


// 提供主题颜色配置的能力
mixin ThemeColorConfig {

  final Map<String, ColorSelector> _colorSelectorMap = Map();

  addColor(String colorKey, {@required Color light, @required Color dark}) {
    _colorSelectorMap[colorKey] = ColorSelector(light, dark);
  }

  getColor(String colorKey) {
    assert( _colorSelectorMap[colorKey] != null, "$colorKey对应的颜色值未配置");
    return _colorSelectorMap[colorKey].color;
  }

  @protected
  // 主题颜色设置
  themeColorsConfig() => {};

}

