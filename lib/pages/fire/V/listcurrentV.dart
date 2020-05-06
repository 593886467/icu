
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:icu/current_index.dart';
class NetworkListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return NetworkListPageState();
  }
}

class NetworkListPageState extends State <NetworkListPage> {

  RefreshController _refreshController =
  RefreshController(initialRefresh: true);
  ListRepository _repository = ListRepository();
  List items = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return configBody();
  }


  /// 获取数据源
  void configData(int type) {
    if(type == 1) {
      items.clear();
      items.addAll(['1','2','3','4',5]);
    }
    items.addAll(['1','2','3','4',5]);
    configEndRefresh(type);
  }


  void configEndRefresh(int type) {
    setState(() {

    });
    if(type == 1) {
      _refreshController.refreshCompleted();
    }else {
      _refreshController.loadComplete();
    }
  }



  Widget configBody () {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        header: WaterDropMaterialHeader(),
        footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("上拉加载");
            }
            else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = Text("加载失败！点击重试！");
            }
            else if(mode == LoadStatus.canLoading){
              body = Text("松手,加载更多!");
            }
            else{
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: configList()

    );

  }

  void _onRefresh() async {
    configData(1);
  }

  void _onLoading() async {
    configData(2);
  }

  /// 配置列表
  Widget configList() {
    return ListView.builder(
        itemCount: items.length,
        itemExtent: 140 ,
        itemBuilder: (BuildContext context, int index){
          if (index > (items.length - 4)) {
            configData(2);
          }
          return ListChiPage();
        }
    );
  }
}


















class ListChiPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 15,top: 10,right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [ColorsMacro.col_FFF,ColorsMacro.col_FFF],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
              stops: [0.0,1]

          ),

          boxShadow: [
            BoxShadow(
                color: ColorsMacro.col_EEE,
                blurRadius: 0,
                offset: Offset(0, 1),
                spreadRadius: 1
            )
          ]
      ),
      
      child: conFigSubView(),

    );
  }


  /// 添加子视图
  Widget conFigSubView() {
    return Container(
      child: Row(

        children: <Widget>[
          Gaps.hGap10,
          configImage('http://via.placeholder.com/350x200', 110, 110,BorderRadius.circular(4)),
          conFigColumPage(),

        ],
      ),
    );
  }

  /// 创建二级控件
  Widget conFigColumPage() {

     return Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10 ,top: 13,right: 10,bottom: 0),
            child:  Column(
              children: <Widget>[
                configShopTitle(),
                configShopName(),
                configYuguzhuan(),
                configPriceOrNum(),

              ],
            ),
          )
      );
  }

  /// 创建标题
  Widget configShopTitle () {
   return Text('dddd' *8,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// 店铺名字
  Widget configShopName () {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage('images/order_shop.png'),
            width: 11,
            height: 11,
          ),
          Gaps.hGap5,
          
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Text(
                '官方旗舰店',
              style: TextStyle(
                fontSize: 10,
                color: ColorsMacro.col_999
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget configYuguzhuan(){
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: 20,
      child: Row(

        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: Image(
                    image: AssetImage('images/order_otoBg.png'),
                  width: 70,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  child: Text(
                    '20元券',
                    style: TextStyle(
                        fontSize: 10,
                        color: ColorsMacro.col_FFF),
                  )
              )
            ],
          ),
          Gaps.hGap10,

          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: Image(
                  image: AssetImage('images/order_bbcBg.png'),
                  width: 70,
                  height: 20,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  child: Text(
                    '20元券',
                    style: TextStyle(
                        fontSize: 10,
                        color: ColorsMacro.col_FFF),
                  )
              )
            ],
          ),
        ],
      ),
    );
  }


  /// 设置价钱
  Widget configPriceOrNum (){

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[

          Text.rich(
              TextSpan(
                children: <TextSpan>[

                  TextSpan(
                      text: "￥",
                      style: TextStyle(
                        color: ColorsMacro.col_D92,
                        fontSize: 12,
                      )
                  ),

                  TextSpan(
                    text: '1000',
                    style: TextStyle(
                      fontSize: 17,
                      color: ColorsMacro.col_D92
                    )
                  ),

                  TextSpan(
                    text: '￥1400',
                    style: TextStyle(
                      color: ColorsMacro.col_999,
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough
                    )
                  )

                ],
              ),

          ),
          Text(
            '已售 1000',
            style: TextStyle(
              fontSize: 10,
              color: ColorsMacro.col_999
            ),
          )
        ],
      ),

    );

  }

}



