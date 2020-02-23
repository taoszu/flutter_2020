import 'package:flutter/services.dart';
import 'package:flutter_2020/theme_page.dart';
import 'package:style/theme/color/dark_theme.dart';
import 'package:style/theme/color/light_theme.dart';
import 'package:ui/page/base_page.dart';
import 'package:style/theme/global_theme.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/global_model.dart';


void main() {
  runApp(MyApp());

  // 状态栏背景设置为透明
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalModel()),
      ],
      child: Consumer<GlobalModel>(
          builder: (context, globalModel, _) {
            GlobalTheme.setDark(globalModel.isDarkTheme);

            return MaterialApp(
                title: 'Flutter 2020',
                debugShowCheckedModeBanner: false,
                themeMode: globalModel.isDarkTheme ? ThemeMode.dark : ThemeMode
                    .light,
                theme: GlobalTheme.lightThemeData,
                darkTheme: GlobalTheme.darkThemeData,
                home: MyHomePage(),
                routes: {"theme_page": (_) => ThemePage()}
            );
          }
      ),
    );
  }
}

class MyHomePage extends BaseStatelessPage {
  @override
  String get appBarTitle => "首页";

  @override
  Widget body(BuildContext context) {
    return Center(
        child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("theme_page");
            },
            child: Text("主题切换页面")));
  }
}
