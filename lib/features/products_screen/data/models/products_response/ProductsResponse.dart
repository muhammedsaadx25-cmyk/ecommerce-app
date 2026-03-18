import 'package:ecommerce_app/features/main_layout/home/data/models/Metadata.dart';


import 'Product.dart';

class ProductsResponse {
  ProductsResponse({
      this.results, 
      this.metadata, 
      this.products,});

  ProductsResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;
  List<Product>? products;



}