import 'package:ecommerce_app/features/cart/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/Brand.dart';

import '../../../main_layout/home/data/models/categories_response/category.dart';


class Product {
  Product({

      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
});

  Product.fromJson(dynamic json) {

    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = (json['ratingsAverage'] as num?)?.toDouble();
    id = json['id'];
  }

  String? id;
  String? title;
  String? imageCover;
  int? quantity;
  Category? category;
  Brand? brand;
  double? ratingsAverage;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['_id'] = id;
    map['title'] = title;
    map['quantity'] = quantity;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['id'] = id;
    return map;
  }

  ProductEntity toProductEntity()=> ProductEntity(id: id, title: title, imageCover: imageCover);

}