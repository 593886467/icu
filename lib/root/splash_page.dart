import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:icu/current_index.dart';

class SlashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SlashPageState();
  }
}

class SlashPageState extends State<SlashPage> {
  TimerUtil _timerUtil;

  List<String> _guideList = [
    Utils.getImgPath('ydy_11'),
    Utils.getImgPath('ydy_22'),
    Utils.getImgPath('ydy_33')
  ];

  List<Widget> _bannerList = List();

  int _status = 0;
  int _count = 3;


  SplashModel _splashModel;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();

  }

  /// 初始化数据
  void _init() {
    _loadSplashData();
    Observable.just(1).delay(Duration(milliseconds: 500)).listen((_) {
      if(SpUtil.getBool(StringsMacro.Splash, defValue: true) &&
          ObjectUtil.isNotEmpty(_guideList)) {
         SpUtil.putBool(StringsMacro.Splash, false);
         _initBanner();
      }else {
         _initSplash();
      }
    });
  }

  /// 获取广告信息
  void _loadSplashData() {
    _splashModel = SpUtil.getObj(StringsMacro.Splashmodel, (v) =>
        SplashModel.fromJson(v));
    if(_splashModel != null) {
      setState(() {

      });
    }

    ListRepository().getSplash().then((model) {
      if(!ObjectUtil.isEmpty(model.imgUrl)) {
        if(_splashModel == null || (_splashModel.imgUrl != model.imgUrl)) {
          SpUtil.putObject(StringsMacro.Splashmodel, model);
          setState(() {
            _splashModel = model;
          });
        }
      }else {
        SpUtil.putObject(StringsMacro.Splashmodel, null);
      }
    });
  }

  /// 初始化banner
  void _initBanner() {
    _initBannerData();
    setState(() {
      _status = 2;
    });
  }


  /// 创建引导页
  void _initBannerData() {
    for(int i = 0 , length = _guideList.length ;i < length ; i++ ) {
      if(i == length - 1) {
        _bannerList.add(
            Stack(
              children: <Widget>[
                InkWell(
                  onTap: _goMain,
                  child:  Image.asset(
                    _guideList[i],
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                )
              ],
            )
          );
      }else {
        _bannerList.add(Image.asset(
            _guideList[i],
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity
        ));
      }
    }
  }

  /// 初始化
  void _initSplash() {
    if(_splashModel == null) {
      _goMain();
    }else {
      _doCountDown();
    }
  }

  /// 加载广告页
  void _doCountDown() {
    setState(() {
      _status = 1;
    });
    _timerUtil = TimerUtil(mTotalTime: 4 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });

      if(_tick == 0) {
        _goMain();
      }
    });
    _timerUtil.startCountDown();
  }

  /// 跳到首页
  void _goMain() {
    print('sddd');
    print(SpUtil.getBool(StringsMacro.Splash));
    SpUtil.putBool(StringsMacro.Splash, false);
    print(SpUtil.getBool(StringsMacro.Splash));
    RouteManager.goMain(context);
  }


  /// 设置默认背景图
  Widget _buildSplashBg() {
    return Image.asset(
      'ios/Runner/launch.png',
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  /// 设置广告页
  Widget _buildAdWidget() {
    if(_splashModel == null) {
      return Container(
        height: 0.0,
      );
    }

    return Offstage(
      offstage: !(_status == 1),
      child: InkWell(
        onTap: () {

        },
        child: Container(
          alignment: Alignment.center,
          child: CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            imageUrl: _splashModel.imgUrl,
            placeholder: (context, url) => _buildSplashBg(),
            errorWidget: (context, url, error) => _buildSplashBg(),
          ),
        ),
      ),
    );
  }








  @override
  Widget build(BuildContext context) {

    return Material(
      child: Stack(
        children: <Widget>[

          Offstage(
            offstage: !(_status == 0),
            child: _buildSplashBg(),
          ),

          Offstage(
            offstage: !(_status == 2),
            child: ObjectUtil.isEmpty(_bannerList)
            ? Container()
            : Swiper(
                itemCount: _bannerList.length,
                autoplay: false,
                loop: false,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white.withOpacity(0.5),
                    activeColor: Colors.white,
                  ),
                  margin: EdgeInsets.only(bottom: 100)
                ),
                itemBuilder:  (BuildContext context, int index) {
                  return _bannerList[index];
                }
            ),
          ),
          _buildAdWidget(),
          new Offstage(
            offstage: !(_status == 1),
            child: new Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  _goMain();
                },
                child: new Container(
                    padding: EdgeInsets.all(12.0),
                    child: new Text(
                      '$_count',
                       style: new TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    decoration: new BoxDecoration(
                        color: Color(0x66000000),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        border: new Border.all(
                            width: 0.33, color: Color(0xffe5e5e5))),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}