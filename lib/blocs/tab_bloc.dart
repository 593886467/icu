


import 'dart:collection';
import 'dart:math';

import 'package:icu/api/apis.dart';
import 'package:icu/blocs/bloc_index.dart';
import 'package:icu/current_index.dart';

class TabBloc implements BlocBase {



  /*属性*/

  // ignore: close_sinks
  BehaviorSubject<List<TreeModel>> _tabTree =
      BehaviorSubject<List<TreeModel>>();

  Sink<List<TreeModel>> get _tabTreeSink => _tabTree.sink;

  Stream<List<TreeModel>> get tabTreeStream => _tabTree.stream;


  /// 分类数据
  List<TreeModel> treeList;

  ComListRepository listRepository = ComListRepository();

  /*触发方法*/


  void bindSystemData(TreeModel model) {
    if(model == null) return;
    treeList = model.children;
  }

  Future getProjectTree(String labelId) {
    return listRepository.getProjectTree().then((value) {
      _tabTreeSink.add(UnmodifiableListView<TreeModel>(value));
    });
  }


  /*重写方法*/

  @override
  Future onRefresh({data}) {
    // TODO: implement onRefresh
    throw UnimplementedError();
  }

  @override
  Future onLoadMore({data}) {
    // TODO: implement onLoadMore
    throw UnimplementedError();
  }

  @override
  Future getData({data}) {
    String labelId = data['labelId'];
    LogUtil.v(labelId);
    switch(labelId){
      case StringIds.titleReposTree:
        return getProjectTree(labelId);
        break;

      default:
        return Future.delayed(Duration(seconds: 1));
        break;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }


}