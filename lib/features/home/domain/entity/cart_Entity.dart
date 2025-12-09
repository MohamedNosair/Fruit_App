import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/features/home/domain/entity/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  CartEntity({required this.cartItems});
  // Add CartItemEntity to cart
  void addCartItem(CartItemEntity item) {
    cartItems.add(item);
  }

  void removeCartItem(CartItemEntity item) {
    cartItems.remove(item);
  }

   calculateTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  // Check if product exists in cart
  bool isExis(ProductEntity product) {
    for (var item in cartItems) {
      if (item.productEntity == product) {
        return true;
      }
    }
    return false;
  }
   
  // Get CartItemEntity for a given product
  CartItemEntity? getCartItem(ProductEntity product) {
    for (var item in cartItems) {
      if (item.productEntity == product) {
        return item;
      }
    }
    return CartItemEntity(productEntity: product, quantity: 1);
  }
}
