import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';


class DataModel {
  final String type;
  final Set<WordPair> data;
  DataModel(this.type, this.data);
}


class Product {
  final String name;
  const Product({this.name});
}


class ItemModel {
  String title;
  Color bgColor;
  String routeName;
  ItemModel({this.title, this.bgColor, this.routeName});
}

typedef Void CartChangedCallback (Product product, bool inCart);


class SplashModel {
  String title;
  String content;
  String url;
  String imgUrl;

  SplashModel({this.title, this.content, this.url, this.imgUrl});

  SplashModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        url = json['url'],
        imgUrl = json['imgUrl'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'url': url,
    'imgUrl': imgUrl,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"content\":\"$content\"");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"imgUrl\":\"$imgUrl\"");
    sb.write('}');
    return sb.toString();
  }
}

