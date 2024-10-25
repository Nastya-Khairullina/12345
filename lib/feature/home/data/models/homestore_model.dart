import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/homestore_entity.dart';
part 'homestore_modelG.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class HomeStoreModel extends HomeStoreEntity{
  const HomeStoreModel({
    required int? id,
    required bool? isFavorites,
    required bool? isNew,
    required String? title,
    required String? subtitle,
    required String? priceWithoutDiscount,
    required String? discountPrice,
    required String? picture,
    required bool? isBuy,
    required bool? isBestSeller,
  }) : super(
      id: id,
      isFavorites:isFavorites,
      isNew: isNew,
      title: title,
      subtitle: subtitle,
      priceWithoutDiscount:priceWithoutDiscount,
      discountPrice:discountPrice,
      picture: picture,
      isBuy: isBuy,
      isBestSeller:isBestSeller
  );
  Map<String, dynamic> toJson() => _$HomeStoreModelToJson(this);
  factory HomeStoreModel.fromJson(Map<String, dynamic> json) => _$HomeStoreModelFromJson(json);
}