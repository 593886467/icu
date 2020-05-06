

import 'package:icu/current_index.dart';
import 'dart:convert' as convert;
import 'package:icu/api/apis.dart';

import 'package:icu/pages/fire/M/banner_model.dart';
import 'package:icu/pages/fire/M/goodslist_model.dart';
class ListRepository {


  Future<List> getTaoBaoGoodList(GoodListModel model) async {
    BaseResp<Map<String, dynamic>>baseResp = await TTNetWorkingManager().
    request(
        Method.post,
        CurrentApi.getPath(CurrentApi.goodList),
        data: model.toJson()
    );

    List good = baseResp.data['goodsList'];
    goodslist_model m = goodslist_model.fromJson(good[0]);
    LogUtil.v(model.toString());
    List<goodslist_model> goodLsit;
    LogUtil.v(goodLsit.length);

    if(baseResp.code != Constant.status_success) {
      LogUtil.v(baseResp.msg);
      LogUtil.v('ddddddddd');
      return Future.error(baseResp.msg);
    }

  }


  Future<List <Data>> getBannerInfo() async {
    BaseResp <List> baseResp = await TTNetWorkingManager()
        .request(
        Method.get,
        CurrentApi.getPath(CurrentApi.banner)
    );
    print('dsdsdsd');
    List<Data> bannerList;
    if(baseResp.data != null) {
      bannerList = baseResp.data.map((value) {
        Data model = Data.fromJson(value);
        LogUtil.v(model.imagePath);
          return model;
        }).toList();
      LogUtil.v(bannerList.length);
    }
    return bannerList;
  }




  Future<SplashModel> getSplash() {
    return Future.delayed(new Duration(milliseconds: 300), () {
      return new SplashModel(
        title: '测试',
        content: '测试',
        url: 'https://www.jianshu.com',
        imgUrl:
        'https://img2.woyaogexing.com/2020/03/10/e5cfaf077edb4d4e83465e27aae25795!1080x1920.jpeg',
      );
    });
  }

}
