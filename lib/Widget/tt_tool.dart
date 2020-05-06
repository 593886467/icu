import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:icu/current_index.dart';


class TTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return TTabBarState();
  }
}

class TTabBarState extends State<TTabBar> {

  var _body;
  /// 选中下标
  int _tabIndex = 0;
  /// 底部图片数组
  var _tabItemages;
  /// 底部按钮文字
  var _appBarTitles = ['金','木','水','火','土'];

  var _appBarWidgetNames = [StringsMacro.Gold, StringsMacro.Wood,
    StringsMacro.Water, StringsMacro.Fire, StringsMacro.Soil];
  /// 默认字体颜色
  final _taBTextStyleNormal = new TextStyle(color: Colors.grey);
  /// 选中字体颜色
  final _taBTextStyleSelected = new TextStyle(color: Colors.black);

  /// 获取数据源
  void initData() {   
    if (_tabItemages == null) {
      _tabItemages = [
        [
          getTabImage('images/home_S.png'),
          getTabImage('images/home.png')
        ],
        [
          getTabImage('images/find_S.png'),
          getTabImage('images/find.png')
        ],
        [

        ],
        [
          getTabImage('images/hot_S.png'),
          getTabImage('images/hot.png')
        ],
        [
          getTabImage('images/my_S.png'),
          getTabImage('images/my.png')
        ],
      ];
    }

    _body = IndexedStack(
      children:configTabBarWidget(),
      index: _tabIndex,
    );
  }

  List<Widget> configTabBarWidget (){
    List<Widget> list = [];
    for (int i = 0; i < _appBarWidgetNames.length; i++) {
      list.add(RouteManager.configCurrentWidget(_appBarWidgetNames[i]));
    }
    return list;
  }


  /// 设置字体
  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return _taBTextStyleSelected;
    }
    return _taBTextStyleNormal;
  }
   
  /// 加载图片
  Image getTabImage(path) {
    if (path.startsWith('http')) {
      return Image.asset(
        path,
        width: 20,
        height: 20
      );
    }else {
      return Image.asset(
        path,
        width: 32,
        height: 32
      );
    }
  }
  
  /// 设置图片
  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabItemages[index][1];
    }
    return _tabItemages[index][0];
  }
  /// 设置文字
  Text getTabTitle(int index) {
    return Text(
      _appBarTitles[index],
      style: getTabTextStyle(index)
    );
  }
  
  /// 创建底部按钮
  List<BottomNavigationBarItem> getBottomNavItems(){
    List<BottomNavigationBarItem>list = List();
    for(var i = 0; i < _appBarTitles.length; i++) {
      list.add( 
         getBottomBarItem(i)
      );
    }
    return list;
  }

  BottomNavigationBarItem getBottomBarItem(int index) {
    print(index);
    return BottomNavigationBarItem(
        icon: getTabIcon(index),
        title: getTabTitle(index)
    );
  }
  


  Widget getTabBar() {
    if (Platform.isIOS) {
      print('ios');
      return CupertinoTabBar(
        items: getBottomNavItems(),
        currentIndex: _tabIndex,
        onTap: (index){
            setState(() {
              _tabIndex =index;
            });
          },
      );
    }else {
      print('andio');
      return BottomNavigationBar(
        items: getBottomNavItems(),
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
            setState(() {
              _tabIndex =index;
            });
          },
          selectedFontSize: 14,
          unselectedFontSize: 12,
          fixedColor: Colors.green,
      );
    }
  }


  Widget configBottomAppBar() {
    return BottomAppBar(
      color: Theme.of(context).accentColor,
      shape: CircularNotchedRectangle(),
      child: configBottomAppBarChild(),
    );
  }

  Widget configBottomAppBarChild() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: configBottomChildWidget()
    );
  }

  List<Widget> configBottomChildWidget () {
    List<Widget> list = List();
    for (var i = 0; i <  _appBarTitles.length; i++) {
      if ( 2 == i) {
        list.add(
          SizedBox(),
        );
      }else {
        list.add(
          GestureDetector(
            onTap: (){
              setState(() {
                _tabIndex = i;
              });
            },
            child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 getTabIcon(i),
                 getTabTitle(i)
               ]
            ), 
          )
        );
      }
    }
    return list;
  }

  Widget configFloatButton() {
    return FloatingActionButton(
      onPressed: (){
        setState(() {
          _tabIndex = 2;
        });
      },
      child:Image.asset(
        'images/plus.png',
         width: 60,
         height: 60
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          primaryColor:ColorsMacro.col_FFF
      ),
      home: Scaffold(

        body: _body,
        floatingActionButton: configFloatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: configBottomAppBar()
      )
    );
  }
}