import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? cpu;
  final String? camera;
  final int? id;
  final String? images;
  final bool? isFavorites;
  final int? price;
  final double? rating;
  final String? sd;
  final String? capacity;
  final String? color;
  final String? title;

  const ProductEntity({
    required this.cpu,
    required this.camera,
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.capacity,
    required this.color,
    required this.title,
  });

  @override
  List<Object?> get props => [cpu, camera, id, images, isFavorites, price, rating, sd,capacity, color, title];
}