import 'package:ecommerce_app/features/cart/domain/entities/cart_item_entity.dart';

import 'Product.dart';

class CartItem {
  CartItem({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartItem.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = (json['price'] as num?)?.toInt();
  }
  int? count;
  String? id;
  Product? product;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }
  CartItemEntity toCartItemEntity()=> CartItemEntity(id: id, count: count, price: price, product: product?.toProductEntity());

}