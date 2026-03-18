import 'package:ecommerce_app/features/main_layout/home/data/models/Metadata.dart';

import 'Brand.dart';

class BrandsResponse {
  BrandsResponse({
      this.results, 
      this.metadata, 
      this.brands,});

  BrandsResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      brands = [];
      json['data'].forEach((v) {
        brands?.add(Brand.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;
  List<Brand>? brands;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (brands != null) {
      map['data'] = brands?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}