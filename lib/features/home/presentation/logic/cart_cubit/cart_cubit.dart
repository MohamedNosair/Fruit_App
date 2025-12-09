import 'package:bloc/bloc.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/features/home/domain/entity/cart_Entity.dart';
import 'package:fruit_app/features/home/domain/entity/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);
  // Add product to cart
  void addProduct(ProductEntity productEntity) {
    // Check if product already exists in cart
    bool isProductExist = cartEntity.isExis(productEntity);
    // Get the CartItemEntity for the product
    CartItemEntity cartItemEntity = cartEntity.getCartItem(productEntity)!;
    if (isProductExist) {
      cartItemEntity.increasQuantity();
    } else {
      cartEntity.addCartItem(cartItemEntity);
    }

    emit(CartItemAdded());
  }

  void removeCartItem(cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }

  void updateCartItem(cartItemEntity) {
    emit(CartItemUpdate());
  }
}
