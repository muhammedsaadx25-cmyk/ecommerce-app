import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';

import 'cart_item.dart';

class Cart {
  Cart({
      this.id, 
      this.cartOwner, 
      this.cartItems,
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  Cart.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      cartItems = [];
      json['products'].forEach((v) {
        cartItems?.add(CartItem.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = (json['__v'] as num?)?.toInt();
    totalCartPrice = (json['totalCartPrice']as num?)?.toInt();
  }
  String? id;
  String? cartOwner;
  List<CartItem>? cartItems;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (cartItems != null) {
      map['products'] = cartItems?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }


  CartEntity toCartEntity()=> CartEntity(cartItems: cartItems?.map((cartItem)=> cartItem.toCartItemEntity()).toList(), totalPrice: totalCartPrice);


}