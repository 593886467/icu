import 'package:flutter/material.dart';
import 'package:icu/model/model_index.dart';
import 'package:icu/utils/utils_index.dart';




var homeList = [
  ItemModel(
    title: '基础组件',
    routeName: StringsMacro.Component,
    bgColor: Color(0xff164396),
  ),

  ItemModel(
    title: '布局类组件',
    routeName: StringsMacro.Layout,
    bgColor: Colors.pinkAccent,
  ),

  ItemModel(
    title: '容器类组件',
    routeName: '',
    bgColor: Colors.blueAccent,
  ),

  ItemModel(
    title: '可滚动组件',
    routeName: StringsMacro.CurrentList,
    bgColor: Color(0xffed5c48),
  ),

  ItemModel(
    title: '功能型组件',
    routeName: '',
    bgColor:  Color(0xff53b28f),
  ),

  ItemModel(
    title: '事件处理与通知',
    routeName: '',
    bgColor: Color(0xff7254b2),
  ),

  ItemModel(
    title: '动画',
    routeName: '',
    bgColor: Color(0xff59bfee),
  ),

  ItemModel(
    title: '自定义组件',
    routeName: StringsMacro.CustonWidget,
    bgColor: Color(0xffb0a4e3),
  ),

  ItemModel(
    title: '文件操作与网络请求',
    routeName: '',
    bgColor: Color(0xff80edae),
  ),

  ItemModel(
    title: '包与插件',
    routeName: '',
    bgColor: Color(0xffff0097),
  ),

  ItemModel(
    title: '国际化',
    routeName: '',
    bgColor: Colors.indigoAccent,
  ),
];