import 'dart:math';

import 'package:flutter/material.dart';

import 'package:icu/current_index.dart';
import 'package:icu/event/event.dart';


class ComListPage extends StatelessWidget {

  ComListPage({Key key, this.labelId, this.cid}) :
      super(key: key);
  final String labelId;
  final int cid;



  RefreshController _refreshController = RefreshController(initialRefresh:false);
  ComListBloc bloc ;



  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<ComListBloc>(context);
    bloc.comListEventStream.listen((event) {
      print(event.cid);
      if(cid == event.cid) {
        configEndRefresh(event.loadstatus);
      }

    });
    return StreamBuilder(
        stream: bloc.comListStream,
        builder: (BuildContext context, AsyncSnapshot<List<ReposModel>> snapshot) {
          int loadStatus = Utils.getLoadStatus(snapshot.hasError, snapshot.data);
          if (loadStatus == 0) {
            print(loadStatus);
            bloc.onRefresh(labelId: labelId,cid: cid);
          }

          return SmartRefresher(
              controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropMaterialHeader(),
            onRefresh: _onRefresh ,
            onLoading: _onLoading,
            child: ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                ReposModel model = snapshot.data[index];
                return ArticleItemPage(model);
              },
            ),
          );
        }
    );

  }



  /*触发方法*/

  void _onRefresh() async {
    bloc.onRefresh(labelId: labelId,cid: cid);
  }

  void _onLoading() async {
    bloc.onLoadMore(labelId: labelId,cid: cid);
  }

  /// 结束刷新
  void configEndRefresh(int type) {
    if(type == 1) {
      _refreshController.refreshCompleted();
    }else {
      _refreshController.loadComplete();
    }
  }


}
