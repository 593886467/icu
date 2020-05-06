import 'dart:collection';
import 'dart:math';

import 'package:icu/api/apis.dart';
import 'package:icu/current_index.dart';
import 'package:icu/event/event.dart';
import 'package:icu/pages/fire/M/banner_model.dart';

class MainBloc implements BlocBase {


  /// 网络请求
  WoodReoSiTory _reoSiTory = WoodReoSiTory();

  ComListRepository listRepository = ComListRepository();


  /// 获取banner
  // ignore: close_sinks
  BehaviorSubject<List<Data>> _banner =
  BehaviorSubject<List<Data>>();
  Sink<List<Data>> get _bannerSink => _banner.sink;
  Stream<List<Data>> get bannerStream => _banner.stream;


  /// 获取热门推荐文章

  // ignore: close_sinks
  BehaviorSubject<List<ReposModel>> _recRepos =
  BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _recReposSink => _recRepos.sink;
  Stream<List<ReposModel>> get recReposStream => _recRepos.stream;

  /// 配置获取微信推荐公共号 Bloc

  // ignore: close_sinks
  BehaviorSubject<List<ReposModel>> _recWxArticle = BehaviorSubject<List<ReposModel>>();
  Sink<List<ReposModel>> get _recWxArticleSink => _recWxArticle.sink;
  Stream<List<ReposModel>> get recWxArticleStream => _recWxArticle.stream;


  /// main_bloc 状态监听
  // ignore: close_sinks
  BehaviorSubject<StatusEvent> _homeEvent = BehaviorSubject<StatusEvent>();
  Sink<StatusEvent> get homeEventSink => _homeEvent.sink;
  Stream<StatusEvent> get homeEventStream => _homeEvent.stream.asBroadcastStream();




  MainBloc() {
    LogUtil.v('MainBloc');
  }


  /*重写方法*/



  @override
  Future getData({data,String labelId, int page}) {
    switch(labelId) {
      case StringIds.titleHome:
        return getHomeData(labelId);
        break;
      default:
        return Future.delayed(Duration(seconds: 1));
    }
  }

  @override
  Future onLoadMore({data, String labelId}) {
   return getData(labelId: labelId, page: 0);
  }

  @override
  Future onRefresh({data, String labelId, bool isReload}) {
    return getData(labelId: labelId, page: 0);
  }

  @override
  void dispose() {
    _recWxArticleSink.close();
    _recReposSink.close();
    _banner.close();
  }


  /*自定义方法*/


  /// 获取首页数据
  Future getHomeData(String labelId) {
    getWoodRecReposData();
    getWoodRecWxArticleData();
    return getBanner(labelId);
  }

  /// 监听banner 数据
  Future getBanner(String labelId) {
    return _reoSiTory.getBannerInfo().then((list) {
      LogUtil.v(list);
      _bannerSink.add(UnmodifiableListView<Data>(list));
    }).catchError((_){

    });

  }

  /// 监听公共号数据改变
  Future getWoodRecWxArticleData() async{
    int _id = 408;
    _reoSiTory.getWxArticleListProject(id: _id).then((list){
      if(list.length > 6){
        list = list.sublist(0, 6);
      }
      _recWxArticleSink.add(UnmodifiableListView<ReposModel>(list));
    }).catchError((_){

    });
  }

  /// 监听推荐数据改变
  Future getWoodRecReposData() async {
    ComReq _comReq = new ComReq(402);
    return _reoSiTory.getProjectList(data: _comReq.toJson()).then((list) {
       if (list.length > 6) {
        list = list.sublist(0, 6);
      }
      _recReposSink.add(UnmodifiableListView<ReposModel>(list));
    }).catchError((_) {

    });
  }











}