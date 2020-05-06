import 'package:flutter/cupertino.dart';


//class LogUtil {
//  static const String _TAG_DEF = "###common_utils###";
//
//  static bool debuggable = false; //是否是debug模式,true: log v 不输出.
//  static String TAG = _TAG_DEF;
//
//  static void init({bool isDebug = false, String tag = _TAG_DEF}) {
//    debuggable = isDebug;
//    TAG = tag;
//  }
//
//  static void e(Object object, {String tag}) {
//    _printLog(tag, '  e  ', object);
//  }
//
//  static void v(Object object, {String tag}) {
//    if (debuggable) {
//      _printLog(tag, '  v  ', object);
//    }
//  }
//
//  static void _printLog(String tag, String stag, Object object) {
//    String da = object.toString();
//    String _tag = (tag == null || tag.isEmpty) ? TAG : tag;
//    while (da.isNotEmpty) {
//      if (da.length > 512) {
//        print("$_tag $stag ${da.substring(0, 512)}");
//        da = da.substring(512, da.length);
//      } else {
//        print("$_tag $stag $da");
//        da = "";
//      }
//    }
//  }
//}

  class LogUtil {
  static var _separator = "=";
  static var _split =
      "$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator";
  static var _title = "Yl-Log";
  static var _isDebug = true;
  static int _limitLength = 800;
  static String _startLine = "$_split$_title$_split";
  static String _endLine = "$_split$_separator$_separator$_separator$_split";

  static void init({String title, @required bool isDebug,int limitLength}) {
    _title = title;
    _isDebug = isDebug;
    _limitLength = limitLength??=_limitLength;
    _startLine = "$_split$_title$_split";
    var endLineStr = StringBuffer();
    var cnCharReg = RegExp("[\u4e00-\u9fa5]");
    for (int i = 0; i < _startLine.length; i++) {
      if (cnCharReg.stringMatch(_startLine[i]) != null) {
        endLineStr.write(_separator);
      }
      endLineStr.write(_separator);
    }
    _endLine = endLineStr.toString();
  }

  //仅Debug模式可见
  static void d(dynamic obj) {
    if (_isDebug) {
      _log(obj.toString());
    }
  }

  static void v(dynamic obj) {
    _log(obj.toString());
  }

  static void _log(String msg) {
    print("$_startLine");
    _logEmpyLine();
    if(msg.length<_limitLength){
      print(msg);
    }else{
      segmentationLog(msg);
    }
    _logEmpyLine();
    print("$_endLine");
  }

  static void segmentationLog(String msg) {
    var outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index!=0) {
        print(outStr);
        outStr.clear();
        var lastIndex = index+1;
        if(msg.length-lastIndex<_limitLength){
          var remainderStr = msg.substring(lastIndex,msg.length);
          print(remainderStr);
          break;
        }
      }
    }
  }

  static void _logEmpyLine(){
    print("");
  }
}
