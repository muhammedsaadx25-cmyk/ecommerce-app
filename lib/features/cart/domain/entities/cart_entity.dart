import 'package:ecommerce_app/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity{
  List<CartItemEntity>? cartItems;
  int? totalPrice;
  CartEntity({required this.cartItems, required this.totalPrice});
}