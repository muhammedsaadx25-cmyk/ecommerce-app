import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/Brand.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response/category.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';

class Product {
  Product({
    this.sold,
    this.images,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
     this.priceAfterDiscount,
  });

  Product.fromJson(dynamic json) {
    sold = (json['sold'] as num?)?.toInt();
    images = json['images'] != null
        ? ((json['images'] as List<dynamic>)
            .map((obj) => obj.toString())
            .toList())
        : [];

    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
     brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = (json['ratingsAverage'] as num).toDouble();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    price = json["price"];
    priceAfterDiscount = json['priceAfterDiscount'];
  }

  int? sold;
  int? price;
  int? quantity;
  int? ratingsQuantity;
  double? ratingsAverage;
  List<String>? images;
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imageCover;
  Category? category;
  Brand? brand;
  String? createdAt;
  String? updatedAt;
  int? priceAfterDiscount;

  ProductEntity toProductEntity() => ProductEntity(
      sold: sold,
      images: images,
      ratingsQuantity: ratingsQuantity,
      id: id,
      title: title,
      slug: slug,
      description: description,
      quantity: quantity,
      price: price,
      imageCover: imageCover,
      category: category,
      brand: brand,
      ratingsAverage: ratingsAverage,
  priceAfterDiscount: priceAfterDiscount,
  );
}
