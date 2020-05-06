import 'package:flutter/material.dart';
import 'package:icu/current_index.dart';

class HomePage extends StatelessWidget {
  String title;
  HomePage({Key key, @required this.title}):
      super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff232540),

      appBar: AppBar(
        title: Text(title,style: TextStyle(color: ColorsMacro.col_FFF)),
        backgroundColor: Color(0xff232440),
        elevation: 0,
      ),
      body: GridView.count(
        primary: false,
        /// 内边距
        padding: const EdgeInsets.all(20.0) ,
        /// 水平widget 之间的间距
        crossAxisSpacing: 20.0,
        /// 垂直widget 之间的间距
        mainAxisSpacing: 20.0,
        /// 行个数
        crossAxisCount: 2,

        childAspectRatio: 1.5,

        children: getList(context),

      ),
    );
  }


  List<Widget> getList(context) {
    List<Widget> _list = [];

    for(int i = 0; i < homeList.length; i++) {
      _list.add(getItem(context, homeList[i]));
    }
    return _list;
  }

  Widget getItem(context, ItemModel item) {
    return InkWell(
      onTap: (){
        print(item.routeName);
        Navigator.push(context, RouteManager.configRouteStr(item.routeName));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [item.bgColor,item.bgColor.withOpacity(0.8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.mirror,
            stops: [0.0,1]

          ),

          boxShadow: [
            BoxShadow(
              color: item.bgColor,
              blurRadius: 0,
              offset: Offset(0, 1),
              spreadRadius: 1
            )
          ]
        ),
        child: Center(
          child: Text(
            item.title,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }


}


