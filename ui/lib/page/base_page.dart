import 'package:flutter/material.dart';
import 'package:ui/widget/app_bar.dart';
import 'package:style/theme/color_selector.dart';

// 提供基础页面的配置
mixin BasePage {
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(context), body: body(context));
  }

  @protected
  Widget appBar(BuildContext context) {
    return PreferredSize(
        child: CustomAppBar(appBarTitle), preferredSize: Size.fromHeight(44.0));
  }

  @protected
  String get appBarTitle;

  @protected
  Widget body(BuildContext context);
}

// 无状态的基础页面
abstract class BaseStatelessPage extends StatelessWidget
    with BasePage, ThemeColorConfig {
  BaseStatelessPage() {
    themeColorsConfig();
  }
}

// 有状态的基础页面
abstract class BaseStatefulPage extends StatefulWidget {
  @protected
  State<StatefulWidget> createState() => state();

  BaseState<BaseStatefulPage> state();
}

// 有状态的基础页面的state
abstract class BaseState<T extends BaseStatefulPage> extends State<T>
    with BasePage, ThemeColorConfig {

  @override
  void initState() {
    themeColorsConfig();
    super.initState();
  }
}
