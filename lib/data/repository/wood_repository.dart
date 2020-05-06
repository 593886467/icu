import 'package:icu/api/apis.dart';
import 'package:icu/current_index.dart';
import 'package:icu/pages/fire/M/banner_model.dart';

class WoodReoSiTory {


  /// 获取banner
  Future<List <Data>> getBannerInfo() async {
    BaseResp <List> baseResp = await TTNetWorkingManager()
        .request(
        Method.get,
        CurrentApi.getPath(CurrentApi.banner)
    );
    List<Data> bannerList;
    if(baseResp.data != null) {
      bannerList = baseResp.data.map((value) {
        Data model = Data.fromJson(value);
        LogUtil.v(model.imagePath);
        return model;
      }).toList();
    }
    return bannerList;
  }


  /// 获取推荐项目
  Future<List<ReposModel>> getArticleListProject(int page) async {
    BaseResp<Map<String, dynamic>> baseResp = await TTNetWorkingManager()
        .request<Map<String, dynamic>>(
        Method.get,
        CurrentApi.getWanAndroidPath(path: CurrentApi.article,page: page));
    List<ReposModel> list;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      list = comData.datas.map((value) {
        return ReposModel.fromJson(value);
      }).toList();
    }
    return list;
  }


  /// 获取首页推荐文章
  Future<List<ReposModel>> getProjectList({int page: 1, data}) async {
    BaseResp<Map<String, dynamic>> baseResp = await TTNetWorkingManager()
        .request<Map<String, dynamic>>(
        Method.get,
        CurrentApi.getWanAndroidPath(path: CurrentApi.PROJECT_LIST, page: page),
        data: data);
    List<ReposModel> list;
    if (baseResp.code != Constant.status_success) {
       return new Future.error(baseResp.msg);
    }
    print('sssss');
    print(baseResp.code);
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      list = comData.datas.map((value) {
        return ReposModel.fromJson(value);
      }).toList();
    }

    return list;
  }

  /// 获取公告号文章
  Future<List<ReposModel>> getWxArticleListProject({int id, int page: 1,data}) async {
      BaseResp<Map<String, dynamic>> baseResp = await TTNetWorkingManager()
          .request<Map<String, dynamic>>(
          Method.get,
          CurrentApi.getWanAndroidPath(path: CurrentApi.wxarticle + '/$id', page: page),
          data: data);
      List<ReposModel> list;
      if (baseResp.code != Constant.status_success) {
        return new Future.error(baseResp.msg);
      }
      if (baseResp.data != null) {
          ComData comData = ComData.fromJson(baseResp.data);
          list = comData.datas.map((value) {
            return ReposModel.fromJson(value);
          }).toList();
       }
      return list;
  }
}
