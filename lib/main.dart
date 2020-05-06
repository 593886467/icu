import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:icu/blocs/bloc_provider.dart';
import 'package:icu/blocs/main_bloc.dart';
import 'current_index.dart';

void main() {
  Global.init(() {
    runApp(BlocProvider<ApplicationBloc>(
        child: BlocProvider(child: MyApp(), bloc: MainBloc()) ,
        bloc: ApplicationBloc()));
  });
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {


  /// 初始化网络配置项
  void _init() {
    BaseOptions baseOptions = TTNetWorkingManager.getDefOptions();
    baseOptions.baseUrl = Constant.serverAddress;
    HttpConfig config = HttpConfig(options: baseOptions);
    config.code = 'errorCode';
    TTNetWorkingManager().setConfig(config);
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      theme: ThemeData(
        accentColor: Colors.white,
        accentTextTheme:  TextTheme(body1: TextStyle(color: Colors.amber))
      ),
        home: SlashPage(),
    );
  }
}