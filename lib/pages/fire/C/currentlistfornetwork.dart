import 'package:flutter/material.dart';
import 'package:icu/pages/fire/V/listcurrentV.dart';


class CurrentListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CurrentListPageState();
  }
}

class CurrentListPageState extends State<CurrentListPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  

  @override
  void initState() {
    super.initState();
    this._tabController = new TabController(vsync: this, length: tabItems.length);
    this._tabController.addListener(() {
      print(this._tabController.toString());
      print(this._tabController.index);
      print(this._tabController.length);
      print(this._tabController.previousIndex);
    });
  }

  List <String> tabItems = ['精选','女装','男装','童装','冬装'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        bottom: TabBar(
          controller: this._tabController,
            tabs: configTabItems()
        ),
      ),

      body: TabBarView(
          children: configTaBBarViewS(),
        controller: this._tabController,
      )
    );

  }

  /// 配置
  List <Widget> configTabItems() {
    List<Widget> list = List();
    for (var i = 0; i <  tabItems.length; i++) {
      final tab = Tab(text: tabItems[i]);
      list.add(tab);
    }
    return list;
  }

  List <Widget> configTaBBarViewS () {
    List <Widget> list = List();
    for (var i = 0; i < tabItems.length; i++) {
      final view = NetworkListPage();
      list.add(view);
    }
    return list;
  }






}
