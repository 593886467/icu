import 'package:json_annotation/json_annotation.dart'; 
  
part 'goodslist_model.g.dart';


@JsonSerializable()
  class goodslist_model extends Object {

  @JsonKey(name: 'origin_id')
  String originId;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'thumb')
  String thumb;

  @JsonKey(name: 'origin_price')
  String originPrice;

  @JsonKey(name: 'zk_final_price')
  String zkFinalPrice;

  @JsonKey(name: 'volume')
  String volume;

  @JsonKey(name: 'coupon_price')
  String couponPrice;

  @JsonKey(name: 'coupon_money')
  String couponMoney;

  @JsonKey(name: 'coupon_start_at')
  String couponStartAt;

  @JsonKey(name: 'coupon_end_at')
  String couponEndAt;

  @JsonKey(name: 'commission_rate')
  String commissionRate;

  @JsonKey(name: 'commission_money')
  int commissionMoney;

  @JsonKey(name: 'level_commission_money')
  int levelCommissionMoney;

  @JsonKey(name: 'small_images')
  List<String> smallImages;

  @JsonKey(name: 'coupon_url')
  String couponUrl;

  @JsonKey(name: 'rid')
  String rid;

  @JsonKey(name: 'oauth_url')
  String oauthUrl;

  @JsonKey(name: 'shop')
  Shop shop;

  @JsonKey(name: 'tbk_pwd')
  List<dynamic> tbkPwd;

  @JsonKey(name: 'video_url')
  String videoUrl;

  @JsonKey(name: 'extras')
  List<dynamic> extras;

  @JsonKey(name: 'barrage')
  List<dynamic> barrage;

  @JsonKey(name: 'level_name')
  String level_name;

  @JsonKey(name: 'pl_url')
  String pl_url;

  @JsonKey(name: 'nick')
  String nick;

  @JsonKey(name: 'coupontotalcount')
  int coupontotalcount;

  @JsonKey(name: 'couponremaincount')
  int couponremaincount;

  @JsonKey(name: 'coupon_url_pdd')
  String coupon_url_pdd;






  goodslist_model(this.originId,this.type,this.title,this.description,this.thumb,this.originPrice,this.zkFinalPrice,this.volume,this.couponPrice,this.couponMoney,this.couponStartAt,this.couponEndAt,this.commissionRate,this.commissionMoney,this.levelCommissionMoney,this.smallImages,this.couponUrl,this.rid,this.oauthUrl,this.shop,this.tbkPwd,this.videoUrl,this.extras,
      this.barrage,this.level_name,this.pl_url,this.nick,this.coupontotalcount,this.couponremaincount,this.coupon_url_pdd);

  factory goodslist_model.fromJson(Map<String, dynamic> srcJson) => _$goodslist_modelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$goodslist_modelToJson(this);

}

  
@JsonSerializable()
  class Shop extends Object {

  @JsonKey(name: 'title')
  String title;

  Shop(this.title,);

  factory Shop.fromJson(Map<String, dynamic> srcJson) => _$ShopFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ShopToJson(this);

}

  
