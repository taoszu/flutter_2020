import 'package:style/theme/color/light_theme.dart';
import 'package:style/theme/color/dark_theme.dart';
import 'package:style/theme/color/base_theme.dart';

// 全局颜色主题
class GlobalTheme {
  static bool _isDark = false;

  static final light = LightTheme();
  static final dark = DarkTheme();

  static setDark(bool isDark) => _isDark = isDark;

  static get isDark => _isDark;

  static BaseTheme get theme => _isDark ? dark : light;

  static final _lightThemeData = BaseTheme.genThemeData(false);
  static final _darkThemeData = BaseTheme.genThemeData(true);

  static get lightThemeData => _lightThemeData;
  static get darkThemeData => _darkThemeData;
}
