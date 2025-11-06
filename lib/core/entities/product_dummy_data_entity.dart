import 'package:fruit_app/core/entities/product_entity.dart';

ProductEntity createDummyProductData() {
  return ProductEntity(
    name: 'Apple',
    code: 'APL123',
    description: 'Fresh and juicy apples',
    price: 1.99,
    reviews: [],
    expirationsMonths: 2,
    numberOfCalories: 52,
    unitAmount: 1,
    isOrganic: true,
    isFeatured: true,
    imageUrl: 'https://example.com/images/apple.png',
  );
 
}
List<ProductEntity> getDummyData() {
  return [
    createDummyProductData(),
    createDummyProductData(),
    createDummyProductData(),
  ];
}