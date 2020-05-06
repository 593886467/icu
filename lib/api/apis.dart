
import 'package:icu/current_index.dart';

class CurrentApi {
  /// 获取淘宝列表数据
  static const String goodList = "amoy/home/goods-list";
  /// 轮播图
  static const String banner = 'banner/json';
  /// 首页文章列表
  static const String article = "article/list";
   /// 公告号文章列表
  static const String wxarticle = "wxarticle/list";
  /// 项目列表数据
  static const String PROJECT_LIST = "project/list";
  /// 项目分类
  static const String PROJECT_TREE = "project/tree";


  /// 拼接URL
  static String getPath(String path) {
    StringBuffer stringBuffer = StringBuffer(Constant.serverAddress);
    if (path != null) {
      stringBuffer.write(path);
    }
     print(stringBuffer.toString())
;    return stringBuffer.toString();
  }

  static String getWanAndroidPath({String path: '', int page, String resType: 'json'}) {
    StringBuffer sb = new StringBuffer(Constant.serverAddress);
    if (path != null) {
      sb.write(path);
    }
    if (page != null) {
      sb.write('/$page');
    }
    if (resType != null && resType.isNotEmpty) {
      sb.write('/$resType');
    }
    print(sb.toString());
    return sb.toString();
  }
}


class StringIds {


  /// 获取相关推荐的文章
  static const String titleReposTree = 'title_repo_tree';
  /// 微信文章树
  static const String titleWxArticleTree = 'title_wxarticle_tree';
  /// 获取首页的数据
  static const String titleHome = 'title_home';
  /// 获取首页相关推荐
  static const String titleRepos = 'title_repos';
  /// 获取首页微信文章
  static const String titleEvents = 'title_events';
  /// 获取分类
  static const String titleSystem = 'title_system';





}
