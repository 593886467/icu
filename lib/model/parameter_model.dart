

import 'package:icu/api/apis.dart';

class GoodListModel {
  int page;
  int sort;
  String cid;
  GoodListModel(this.page, this.sort, this.cid);

  GoodListModel.fromJson(Map<String, dynamic> json)
  :page = json['page'],
   sort = json['sort'],
   cid = json['cid'];

  Map<String, dynamic> toJson() => {
    'page':page,
    'sort':sort,
    'cid':cid
  };

  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"page\":\"$page");
    sb.write("\"sort\":\$sort");
    sb.write("\"cid\":\$cid");
    sb.write('}');
    return sb.toString();
  }

}
