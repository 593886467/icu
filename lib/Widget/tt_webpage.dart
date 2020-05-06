import 'package:icu/Widget/tt_customwidget.dart';
import 'package:icu/utils/utils_index.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';
import 'dart:convert';









class TTWebViewPlugin extends StatefulWidget {

  final String title;
  final String url;

  TTWebViewPlugin({
    Key key,
    this.title,
    this.url
  }):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TTWebViewPluginState();
  }
}

class TTWebViewPluginState extends State<TTWebViewPlugin> {


  FlutterWebviewPlugin  _flutterWebViewPlugin = FlutterWebviewPlugin();
  double lineProgress = 0.0;

  /*生命周期*/
  @override
  void initState() {
    super.initState();
    _flutterWebViewPlugin.onProgressChanged.listen((event) {
      LogUtil.v(event);
      setState(() {
        lineProgress = event;
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return WebviewScaffold(
      appBar: _setTitle(context),
        url: widget.url,
        mediaPlaybackRequiresUserGesture: false,
        withZoom: false,
        withLocalStorage: true,
        hidden: true,
    );
  }

  @override
  void dispose() {
    _flutterWebViewPlugin.dispose();
    super.dispose();
  }

  /*触发方法*/

  /*构建视图*/

  _setTitle(context) {
    return AppBar(
      brightness: Brightness.light,
      title: Text(widget.title, style: TextStyle(color: Colors.black, fontSize: 20)),
      elevation: 1,
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context)),
      backgroundColor: Colors.white,
      centerTitle: true,
      bottom: PreferredSize(
        child: TTProgressBar(progress: lineProgress),
        preferredSize: Size.fromHeight(0.1),
      ),
    );
  }

}


class TTWebScaffold extends StatefulWidget {

  final String title;
  final String url;

  TTWebScaffold({
    Key key,
    this.title,
    this.url
  }):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TTWebScaffoldState();
  }
}


class TTWebScaffoldState extends State<TTWebScaffold> {

  WebViewController _controller;
  double _height = 100;



  /*生命周期*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title ,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),

      body: configBody(),
    );
  }
  /*触发方法*/

  /*构建视图*/
  Widget configBody() {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        _controller = controller;
      },
//      javascriptChannels: <JavascriptChannel>[
//        _toasterJavascriptChannel(context),
//      ].toSet(),
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          print('blocking navigation to $request}');
          return NavigationDecision.prevent;
        }
        print('allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        //调用JS得到实际高度
        _controller.evaluateJavascript("document.documentElement.clientHeight;").then((result){
          setState(() {
            _height = double.parse(result);
            print("高度$_height");
          });
        }
        );
        print('Page finished loading: $url');
      },
      gestureNavigationEnabled: true,

    );
  }

//  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
//    return JavascriptChannel(
//        name: 'Toaster',
//        onMessageReceived: (JavascriptMessage message) {
//          Scaffold.of(context).showSnackBar(
//            SnackBar(content: Text(message.message)),
//          );
//        });
//  }

}
