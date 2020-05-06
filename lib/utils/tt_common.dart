import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:icu/current_index.dart';




class ColorsMacro {
  static const Color app_main = Colors.white;
  static const Color col_333  = Color(0xFF333333);
  static const Color col_FFF  = Color(0xFFFFFFFF);
  static const Color col_F6F  = Color(0xFFF6F6F6);
  static const Color col_CCC  = Color(0xFFCCCCCC);
  static const Color col_FAF  = Color(0xFFFAFAFA);
  static const Color col_CDA  = Color(0xFFCDA756);
  static const Color col_666  = Color(0xFF666666);
  static const Color col_E5E  = Color(0xFFE5E5E5);
  static const Color col_999  = Color(0xFF999999);
  static const Color col_EEE  = Color(0xFFEEEEEE);
  static const Color col_D92  = Color(0xFFD92B24);
  static const Color col_F7F  = Color(0xFFF7F7F7);
}

class Utils {

  static String getImgPath(String name, {String format: 'png'}) {
    return 'images/$name.$format';
  }

  static String getTimeLine(BuildContext context, int timeMillis) {
    return TimelineUtil.format(timeMillis,
        locale: Localizations.localeOf(context).languageCode,
        dayFormat: DayFormat.Common);
  }


  static int getLoadStatus(bool hasError, List data) {
    if (hasError) return  1;
    if (data == null) {
      return 0;
    } else if (data.isEmpty) {
      return 1;
    } else {
      return 2;
    }
  }

}

class SizeMacro {
  // 屏幕宽
  double screenWidth = ScreenUtil.getInstance().screenWidth;
  // 屏幕高
  double screenHeight = ScreenUtil.getInstance().screenHeight;
  // 屏幕像素密度
  double screenDensity = ScreenUtil.getInstance().screenDensity;
  // 系统状态栏高度
  double statusBarHeight = ScreenUtil.getInstance().statusBarHeight;
  // BottomBar高度
  double bottomBarHeight = ScreenUtil.getInstance().bottomBarHeight;
  // 系统AppBar高度
  double appBarHeight = ScreenUtil.getInstance().appBarHeight;
  // 根据屏幕宽适配后尺寸
  double adapterW100 = ScreenUtil.getInstance().getWidth(100);
  // 根据屏幕高适配后尺寸
  double adapterH100 = ScreenUtil.getInstance().getHeight(100);
  // 根据屏幕宽适配后字体尺寸
  double adapterSp100 = ScreenUtil.getInstance().getSp(100);
  // 根据屏幕宽适配后尺寸(输入px)
  double adapterW100px = ScreenUtil.getInstance().getWidthPx(300);
  // 根据屏幕高适配后尺寸(输入px)
  double adapterH100px = ScreenUtil.getInstance().getHeightPx(300);

  double setWidth(double w) {
    return  ScreenUtil.getInstance().getWidth(w);
  }
}




class Dimens {
  static const double font_12 = 12;
  static const double font_14 = 14;
  static const double font_16 = 16;
  static const double font_18 = 18;

  static const double dp5 = 5;
  static const double dp10 = 10;
  static const double dp15 = 15;
  static const double dp20 = 20;
}

class Gaps {

  // 水平间隔
  static Widget hGap5 = SizedBox(width: Dimens.dp5);
  static Widget hGap10 = SizedBox(width: Dimens.dp10);

  // 垂直间隔
  static Widget vGap5 = SizedBox(height: Dimens.dp5);
  static Widget vGap10 = SizedBox(height: Dimens.dp10);
  static Widget vGap15 = SizedBox(height: Dimens.dp15);
  static Widget vGap20 = SizedBox(height: Dimens.dp20);

}


class TextStyleMacro {
  static TextStyle titleBloD163 = TextStyle(
    fontSize: Dimens.font_16,
    color: ColorsMacro.col_333,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleNor163 = TextStyle(
    fontSize: Dimens.font_16,
    color: ColorsMacro.col_333,
  );
  static TextStyle titleNor146 = TextStyle(
    fontSize: Dimens.font_14,
    color: ColorsMacro.col_666,
  );
  static TextStyle titleNor149 = TextStyle(
    fontSize: Dimens.font_14,
    color: ColorsMacro.col_999,
  );
  static TextStyle titleNor129 = TextStyle(
    fontSize: Dimens.font_12,
    color: ColorsMacro.col_999,
  );
  static TextStyle titleNor126 = TextStyle(
    fontSize: Dimens.font_12,
    color: ColorsMacro.col_666,
  );
  static const TextStyle appTitle = TextStyle(
    fontSize: Dimens.font_18,
    color: ColorsMacro.col_333,
  );
}

