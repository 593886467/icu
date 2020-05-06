import 'package:flutter/material.dart';
import 'package:icu/current_index.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:icu/pages/wood/C/tab_page.dart';





class RouteManager {

  /// 跳到首页
  static void goMain(BuildContext context) {
    pushReplacementPage(context, StringsMacro.TabBar);
  }
  /*
  * 跳到指定界面 带返回按钮
  * pagename 注册的路由
  * */
  static void pushNamed(BuildContext context, String pageName) {
    Navigator.pushNamed(context, pageName);
  }

  /*
  * 跳到指定界面 带返回按钮
  * 安卓风格
  * */
  static void pushPage(BuildContext context, String pageName) {
    Navigator.push(context, configRouteStr(pageName));
  }

  /*
  * 跳到指定界面  带返回按钮
  * iOS 风格
  * */
  static void pushCuperPage(BuildContext context, String pageName) {
    Navigator.push(context, configCuPerPageRoute(pageName));
  }

  /*
  *  设置入口页
  *  context
  *  pageName 需要在main 注册
  * */
  static void pushReplacementNamed(BuildContext context, String pageName) {
    Navigator.of(context).pushReplacementNamed(pageName);
  }

  /*
  *  设置入口页
  *  context
  *  Page
  * */
  static void pushReplacementPage(BuildContext context, String pageName) {
    print(pageName);
    Navigator.pushReplacement(context, configRouteStr(pageName));

  }


  /*
  * 跳转到web界面
  * */
  static void pushWeb(BuildContext context,
      {String title, String titleId, String url, bool isHome: false}) {
    if (context == null || ObjectUtil.isEmpty(url)) return;
    Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (ctx) => TTWebViewPlugin(
                title: title,
                url: url,
              )
          ));
  }

  static void pushTabPage(BuildContext context,
  {String labelId, String title, String titleId, TreeModel treeModel}) {
    if(context == null) return;
    Navigator.push(context,
        CupertinoPageRoute(
            builder: (ctx) => BlocProvider<TabBloc>(
                child: TabPage(
                  labelId: labelId,
                  title: title,
                  titleId: titleId,
                  treeModel: treeModel,
                ), bloc: TabBloc()))
    );
  }





  static Route<dynamic> configRoute(RouteSettings settings) {
    final name = settings.name;
    print(name);
    return configRouteStr(name);
  }

  /*
  * 获取带路由的安卓风格 page
  * */
  static Route<dynamic> configRouteStr(String name) {
    return MaterialPageRoute(builder: (_) =>
        configCurrentWidget(name));
  }

  /*
  * 获取带路由的iOS风格 page
  * */
  static Route<dynamic> configCuPerPageRoute(String name) {
    return CupertinoPageRoute(builder: (_) =>
        configCurrentWidget(name));
  }


  /*
  * 获取page
  * */
  static Widget configCurrentWidget(String name) {
    print(name);
    switch (name) {
      case StringsMacro.TabBar:
        return TTabBar();
      case StringsMacro.Fire:
        return HomePage(title: 'home');
      case StringsMacro.Gold:
        return Goldpage();
      case StringsMacro.Soil:
        return Soilpage();
      case StringsMacro.Water:
        return Waterpage();
      case StringsMacro.Wood:
        return Woodpage();
      case StringsMacro.Component:
        return BasicComponentsWidget();
      case StringsMacro.Layout:
        return CurrentLayoutWidget();
      case StringsMacro.CustonWidget:
        return CustomWidgetPage();
      case StringsMacro.CurrentList:
        return CurrentListPage();
      case StringsMacro.Splash:
        return SlashPage();
      default:
        return NothingWidget();
    }
  }
}

class StringsMacro {

  static const String TabBar = '/';
  static const String Fire = '/fire';
  static const String Gold = '/gold';
  static const String Soil = '/soil';
  static const String Water = '/water';
  static const String Wood = '/wood';
  static const String Component = '/comp';
  static const String Layout = "/layout";
  static const String CustonWidget ='/custon';
  static const String CurrentList = "/listcureent";
  static const String Splash = '/Splash';
  static const String Splashmodel = '/Splashmodel';
  static const String CurrentWeb = '/currentWeb';

}