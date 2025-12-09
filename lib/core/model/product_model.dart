import 'package:fruit_app/core/entities/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final num sellingCount;
  String? imageUrl;
  final num expirationsMonths;
  final bool isOrganic;
  final num numberOfCalories;
  // final num avgRating;
  // final num ratingCount = 0;
  final int unitAmount;
  // final List<ReviewModel> reviews;
  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.expirationsMonths,
    required this.numberOfCalories,
    // required this.avgRating,
    required this.unitAmount,
    required this.sellingCount,
    // required this.reviews,
    required this.price,
    required this.isOrganic,
    required this.isFeatured,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      // avgRating: getAvgRating(json['reviews']),
      name: json['name'],
      code: json['code'],
      description: json['description'],
      expirationsMonths: json['expirations_months'],
      numberOfCalories: json['number_of_calories'],
      unitAmount: json['unit_amount'],
      sellingCount: json['selling_count'],
      // reviews: json['reviews'] != null
      //     ? List<ReviewModel>.from(
      //         json['reviews'].map((e) => ReviewModel.fromJson(e)),
      //       )
      //     : [],
      price: json['price'],
      isOrganic: json['is_organic'],
      isFeatured: json['is_featured'],
      imageUrl: json['image_url'],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      sellingCount: sellingCount,
      name: name,
      code: code,
      description: description,
      price: price,
      // reviews: reviews.map((e) => e.toEntity()).toList(),
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      // 'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
