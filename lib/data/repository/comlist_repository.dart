import 'package:icu/api/apis.dart';
import 'package:icu/current_index.dart';

class ComListRepository {


  /// 获取项目分类
  // ignore: missing_return
  Future<List<TreeModel>> getProjectTree() async {
    BaseResp<List> baseResp = await TTNetWorkingManager().request(Method.get,
          CurrentApi.getWanAndroidPath(path: CurrentApi.PROJECT_TREE));
    List<TreeModel> treeList;
    if(baseResp.code != Constant.status_success) {
      return Future.error(baseResp.msg);
    }
    if(baseResp.data != null) {
      treeList = baseResp.data.map((e) {
        return TreeModel.fromJson(e);
      }).toList();
      return treeList;
    }
  }







}

