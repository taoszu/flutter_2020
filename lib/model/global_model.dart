import 'package:flutter/material.dart';


// 全局数据管理
class GlobalModel with ChangeNotifier {
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  void switchTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}