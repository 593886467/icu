import 'package:json_annotation/json_annotation.dart'; 
  
part 'banner_model.g.dart';


@JsonSerializable()
  class banner_model extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  banner_model(this.data,this.errorCode,this.errorMsg,);

  factory banner_model.fromJson(Map<String, dynamic> srcJson) => _$banner_modelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$banner_modelToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

//  @JsonKey(name: 'desc')
//  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'imagePath')
  String imagePath;

  @JsonKey(name: 'isVisible')
  int isVisible;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'url')
  String url;


  Data(this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
