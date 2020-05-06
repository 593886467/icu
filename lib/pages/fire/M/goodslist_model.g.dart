// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goodslist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

goodslist_model _$goodslist_modelFromJson(Map<String, dynamic> json) {
  print(json);
  return goodslist_model(
    json['origin_id'] as String,
    json['type'] as int,
    json['title'] as String,
    json['description'] as String,
    json['thumb'] as String,
    json['origin_price'] as String,
    json['zk_final_price'] as String,
    json['volume'] as String,
    json['coupon_price'] as String,
    json['coupon_money'] as String,
    json['coupon_start_at'] as String,
    json['coupon_end_at'] as String,
    json['commission_rate'] as String,
    json['commission_money'] as int,
    json['level_commission_money'] as int,
    (json['small_images'] as List)?.map((e) => e as String)?.toList(),
    json['coupon_url'] as String,
    json['rid'] as String,
    json['oauth_url'] as String,
    json['shop'] == null
        ? null
        : Shop.fromJson(json['shop'] as Map<String, dynamic>),
    json['tbk_pwd'] as List,
    json['video_url'] as String,
    json['extras'] as List,
    json['barrage'] as List,
    json['level_name'] as String,
    json['pl_url'] as String,
    json['nick'] as String,
    json['coupontotalcount'] as int,
    json['couponremaincount'] as int,
    json['coupon_url_pdd'] as String,
  );
}

Map<String, dynamic> _$goodslist_modelToJson(goodslist_model instance) =>
    <String, dynamic>{
      'origin_id': instance.originId,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'thumb': instance.thumb,
      'origin_price': instance.originPrice,
      'zk_final_price': instance.zkFinalPrice,
      'volume': instance.volume,
      'coupon_price': instance.couponPrice,
      'coupon_money': instance.couponMoney,
      'coupon_start_at': instance.couponStartAt,
      'coupon_end_at': instance.couponEndAt,
      'commission_rate': instance.commissionRate,
      'commission_money': instance.commissionMoney,
      'level_commission_money': instance.levelCommissionMoney,
      'small_images': instance.smallImages,
      'coupon_url': instance.couponUrl,
      'rid': instance.rid,
      'oauth_url': instance.oauthUrl,
      'shop': instance.shop,
      'tbk_pwd': instance.tbkPwd,
      'video_url': instance.videoUrl,
      'extras': instance.extras,
      'barrage': instance.barrage,
      'level_name': instance.level_name,
      'pl_url': instance.pl_url,
      'nick': instance.nick,
      'coupontotalcount': instance.coupontotalcount,
      'couponremaincount': instance.couponremaincount,
      'coupon_url_pdd': instance.coupon_url_pdd,
    };

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
    json['title'] as String,
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'title': instance.title,
    };
