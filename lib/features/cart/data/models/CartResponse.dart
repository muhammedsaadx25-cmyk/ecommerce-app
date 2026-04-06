import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';

import 'Cart.dart';

class CartResponse {
  CartResponse({
      this.status, 
      this.numOfCartItems, 
      this.cartId, 
      this.cart,});

  CartResponse.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    cart = json['data'] != null ? Cart.fromJson(json['data']) : null;
  }
  String? status;
  int? numOfCartItems;
  String? cartId;
  Cart? cart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (cart != null) {
      map['data'] = cart?.toJson();
    }
    return map;
  }



}