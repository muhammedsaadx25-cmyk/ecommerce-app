import 'package:ecommerce_app/features/cart/domain/entities/product_entity.dart';

class CartItemEntity{
  int? count;
  String? id;
  int? price;
  ProductEntity? product;
  CartItemEntity({required this.id, required this.count, required this.price, required this.product});
}