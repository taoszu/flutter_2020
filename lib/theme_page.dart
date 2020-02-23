import 'package:provider/provider.dart';
import 'package:ui/page/base_page.dart';
import 'package:style/theme/global_theme.dart';
import 'package:flutter/material.dart';

import 'model/global_model.dart';

class ThemePage extends BaseStatelessPage {
  @override
  String get appBarTitle => "主题切换页面";

  @override
  Widget body(BuildContext context) {
    final globalModel = Provider.of<GlobalModel>(context, listen: false);
    final theme = GlobalTheme.theme;

    final bgFontColor =
        globalModel.isDarkTheme ? Color(0X4D000000) : Color(0X4DFFFFFF);

    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 24, right: 24, bottom: 32, top: 18),
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Switch(
                  value: globalModel.isDarkTheme,
                  onChanged: (_) {
                    globalModel.switchTheme();
                  }),
              Text(GlobalTheme.isDark ? "黑夜模式" : "白天模式",
                  style: TextStyle(
                      fontSize: 16, color: GlobalTheme.light.primaryFontColor))
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _labelWidget(label: "背景颜色"),
                _colorWidget(
                    text: "通用背景色",
                    color: theme.appBgColor,
                    fontColor: bgFontColor)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _labelWidget(label: "页面颜色"),
                _colorWidget(
                    text: "通用页面色",
                    color: theme.mainBgColor,
                    fontColor: bgFontColor)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _labelWidget(label: "辅助色系"),
                _colorWidget(
                    text: "主题色",
                    color: theme.themeColor,
                    fontColor: Color(0XFFFFFFFF)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _labelWidget(label: "文字颜色"),
                _colorWidget(
                    text: "主颜色",
                    color: theme.primaryFontColor,
                    fontColor: Color(0XFFFFFFFF)),
              ],
            )
          ],
        ));
  }

  _labelWidget({String label}) {
    return Padding(
        padding: EdgeInsets.only(top: 32, bottom: 9),
        child: Text(label,
            style: TextStyle(color: Color(0XFF272727), fontSize: 16)));
  }

  _colorWidget({String text, Color color, Color fontColor}) {
    return Padding(
        padding: EdgeInsets.only(bottom: 9),
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: color,
                border: color.withOpacity(1) == Colors.white
                    ? Border.all(color: Color(0XFF979797))
                    : null),
            child: Container(
                height: 40,
                child: Center(
                    child: Text("${_color2Str(color)}  $text",
                        style: TextStyle(
                          fontSize: 14,
                          color: fontColor.withOpacity(1) == Colors.white &&
                                  color.withOpacity(1) == Colors.white
                              ? Color(0XFF000000).withOpacity(0.3)
                              : fontColor,
                        ))))));
  }

  _color2Str(Color color) {
    var red = color.red;
    var green = color.green;
    var blue = color.blue;
    var opacity = (color.opacity * 100).round();

    warpRadix(int value) {
      var str = value.toRadixString(16).toUpperCase();
      if (value <= 15) {
        str = '0$str';
      }
      return str;
    }

    var colorStr = "#${warpRadix(red)}${warpRadix(green)}${warpRadix(blue)}";
    if (opacity < 100) {
      colorStr = colorStr + " 透明度${opacity.toStringAsPrecision(2)}%";
    }
    return colorStr;
  }
}
