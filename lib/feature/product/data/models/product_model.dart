import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product_entity.dart';
part 'product_modelG.dart';

@JsonSerializable(/* fieldRename: FieldRename.snake, explicitToJson: true */)
class ProductModel extends ProductEntity{
  @JsonKey(name: 'CPU')
  final String? cpu;

  const ProductModel({
    this.cpu,
    required String? camera,
    required int? id,
    required String? images,
    required bool? isFavorites,
    required int? price,
    required double? rating,
    required String? sd,
    required String? capacity,
    required String? color,
    required String? title,
  }
      ) : super(
    cpu: cpu,
    camera: camera,

    id: id,
    images: images,
    isFavorites: isFavorites,
    price: price,
    rating: rating,
    sd: sd,
    capacity: capacity,
    color: color,
    title: title,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}