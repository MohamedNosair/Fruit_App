import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String code;
  final String description;
  final num price;
  final num sellingCount;
  final bool isFeatured;
  final String? imageUrl;
  final num expirationsMonths;
  final bool isOrganic;
  final num numberOfCalories;
  // final num avgRating = 0;
  // final num ratingCount = 0;
  final num unitAmount;
  // final List<ReviewEntity> reviews;
  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    // required this.reviews,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    required this.isFeatured,
    this.imageUrl,
    required this.sellingCount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [code];
}
