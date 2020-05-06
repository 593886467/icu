
import 'dart:collection';
import 'package:flustars/flustars.dart';
import 'package:icu/api/apis.dart';
import 'package:icu/current_index.dart';
import 'package:icu/event/event.dart';
class ComListBloc implements BlocBase {


  // ignore: close_sinks
  BehaviorSubject<List<ReposModel>> _comListData =
  BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _comListSink => _comListData.sink;

  Stream<List<ReposModel>> get comListStream => _comListData.stream;


  // ignore: close_sinks
  BehaviorSubject<StatusEvent> _comListEvent = BehaviorSubject<StatusEvent>();

  Sink<StatusEvent> get _comListEventSink => _comListEvent.sink;

  Stream<StatusEvent> get comListEventStream =>
      _comListEvent.stream.asBroadcastStream();
  
  List<ReposModel> comList;
  int _comListPage = 0;
  
  
  
  
  
  ComListRepository listRepository = ComListRepository();

  WoodReoSiTory reoSiTory = WoodReoSiTory();

  
  ComListBloc() {
    print('d');
  }


  /*触发方法*/


  Future getRepos(String labelId, int cid , int page) async {
    ComReq _comReq = ComReq(cid);
    return reoSiTory
        .getProjectList(page: page,data:  _comReq.toJson())
        .then((value){
          if(comList == null) comList = List();
          if(page == 1){
            comList.clear();
          }
          comList.addAll(value);
          _comListSink.add(UnmodifiableListView<ReposModel>(comList));
          _comListEventSink.add(StatusEvent(labelId, ObjectUtil.isEmpty(value)
          ? RequestStatus.noMore : RequestStatus.success, page == 1 ? 1 : 2, cid: cid));
    }).catchError((_) {
      _comListPage--;
      _comListEventSink.add(StatusEvent(labelId, RequestStatus.fail,page == 1 ? 1 : 2,cid : cid));
    });

  }
  /*重写方法*/


 @override
  Future getData({data,String labelId, int cid, int page}) {
   switch(labelId) {
     case StringIds.titleReposTree:
       return getRepos(labelId, cid,page);
       break;

     default:  
       return Future.delayed(Duration(seconds: 1));
       break;
   }
  }


  @override
  Future onLoadMore({data, String labelId, int cid}) {
   int _page = 0;
   _page = ++_comListPage;
   return getData(labelId: labelId, cid: cid, page: _page);
  }

  @override
  Future onRefresh({data, String labelId, int cid}) {

   switch(labelId) {
     case StringIds.titleReposTree:
       _comListPage = 1;
       break;


     default:
       break;
   }
   return getData(labelId: labelId,cid: cid,page: _comListPage);

  }

  @override
  void dispose() {
    _comListData.close();
    _comListEvent.close();
  }









}
