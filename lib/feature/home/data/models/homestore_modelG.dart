part of 'homestore_model.dart';

HomeStoreModel _$HomeStoreModelFromJson(Map<String, dynamic> json) =>
    HomeStoreModel(
      id: json['id'] as int?,
      isFavorites: json['is_favorites'] as bool?,
      isNew: json['is_new'] as bool?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      priceWithoutDiscount: json['price_without_discount'] as String?,
      discountPrice: json['discount_price'] as String?,
      picture:json['picture'] as String?,
      isBuy: json['is_buy'] as bool?,
      isBestSeller: json['is_bestSeller'] as bool?,
    );

Map<String, dynamic> _$HomeStoreModelToJson(HomeStoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_favorites': instance.isFavorites,
      'is_new': instance.isNew,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price_without_discount': instance.priceWithoutDiscount,
      'discount_price': instance.discountPrice,
      'picture': instance.picture,
      'is_buy': instance.isBuy,
      'is_bestSeller': instance.isBestSeller,
    };
