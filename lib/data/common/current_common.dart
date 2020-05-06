import 'global.dart';


/// 配置默认网络请求信息
class Constant {
  /// 域名
  static String serverAddress = baseUrl;

  static const String server_bizId = "1";
  /// 成功状态值
  static const int status_success = 0;
  /// 域名
  static String baseUrl = getServe();
  /// 默认初始化页数
  static const int default_page = 1;

  static const int default_server = 0;
  /// 测试服务器
  static const String test_Server = "https://www.wanandroid.com/";
  /// 予发布服务器
  static const String reLease_Server = test_Server;
  /// 正式环境
  static const String formal_Server = test_Server;

  /// 获取对应的服务器
  static String getServe() {
    if(default_page == 0) {
      return test_Server;
    }else if(default_page == 1) {
      return formal_Server;
    }else {
      return reLease_Server;
    }
  }

}

/// 配置默认app信息
class AppConfig {
  static const String appName = "ICU";
  static const String version = '0.0.1';
  static const bool isDebug = Global.kReleaseMode;
}





