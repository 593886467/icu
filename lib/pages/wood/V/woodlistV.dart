
import 'package:flutter/material.dart';
import 'package:icu/api/apis.dart';
import 'package:icu/current_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:icu/pages/fire/M/banner_model.dart';
import 'woodbannerV.dart';
import 'package:flustars/flustars.dart';


bool isHomeInit = true;

class TTRefreshWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TTRefreshWidgetState();
  }
}

class TTRefreshWidgetState extends State <TTRefreshWidget> {

  /*属性*/

  RefreshController _refreshController = RefreshController(initialRefresh:false);
  List<Data> _items;
  ListRepository _repository = ListRepository();
  MainBloc bloc;

  /*重写方法*/

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MainBloc>(context);
    Observable.just(1).delay(new Duration(milliseconds: 500)).listen((_) {
      bloc.getWoodRecReposData();
    });

    if(isHomeInit) {
      isHomeInit = false;
      Observable.just(1).delay(Duration(milliseconds: 500)).listen((event) {
        bloc.onRefresh(labelId: StringIds.titleHome);
      });
    }
    return StreamBuilder(
        stream:  bloc.bannerStream,
        builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot){
          return configBody(bloc, snapshot);
        });
  }







  /*构建视图*/


  Widget configChildWidget(MainBloc bloc ,AsyncSnapshot<List<Data>> snapshot) {
    return ListView(
      children: <Widget>[
        buildBannerWidget(context, snapshot.data),
        SizedBox(height: 10,child: Container(color: ColorsMacro.col_F7F)),
        StreamBuilder(
            stream: bloc.recReposStream,
            builder: (BuildContext context,
                AsyncSnapshot<List<ReposModel>> snapshot) {
              return createRepos(context, snapshot.data , 1);
            }),
        StreamBuilder(
            stream: bloc.recWxArticleStream,
            builder: (BuildContext context,
              AsyncSnapshot<List<ReposModel>> snapshot) {
              return createRepos(context, snapshot.data , 2);
            }),
      ],
    );
  }

  /// 创建推荐文章
  Widget createRepos(BuildContext context, List<ReposModel> list, int type) {
    if (ObjectUtil.isEmpty(list)) {
      return new Container(
        color: Colors.red,
        height: 0,
      );
    }
    List<Widget> _children = list.map((model) {
      return ArticleItemPage(model);
    }).toList();
    List<Widget> children = new List();
    children.add(
      HeaderItem(
        margin: EdgeInsets.only(left: 15),
        title: type == 1 ? '推荐文章' : '公告号文章',
        titleColor: ColorsMacro.col_333,
        leftIcon: Icons.library_books,
        onTap: () {
          RouteManager.pushTabPage(context,
          labelId: type == 1 ? StringIds.titleReposTree : StringIds.titleWxArticleTree,
            titleId: type == 1 ? StringIds.titleReposTree : StringIds.titleWxArticleTree
          );
        },
      )
    );
    children.addAll(_children);
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }







  /// 创建body
  Widget configBody (MainBloc bloc, AsyncSnapshot<List<Data>> snapshot) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        controller: _refreshController,
        header: WaterDropMaterialHeader(),
        onRefresh: () {
          return bloc.onRefresh();
        },
        child: configChildWidget(bloc, snapshot)
    );
  }


  /*触发方法*/

  void _onRefresh() async {
    configData(1);
  }

  void _onLoading() async {
    configData(2);
  }

  /// 结束刷新
  void configEndRefresh(int type) {
    if(type == 1) {
      _refreshController.refreshCompleted();
    }else {
      _refreshController.loadComplete();
    }
  }

  void configData(int type) {
    //bloc.getWoodRecReposData();
    configEndRefresh(type);
  }



}