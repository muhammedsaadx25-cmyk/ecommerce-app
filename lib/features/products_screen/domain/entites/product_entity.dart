import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/Brand.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response/category.dart';

class ProductEntity {
  int? sold;
  List<String>? images;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  int? priceAfterDiscount;
  ProductEntity(
      {required this.sold,
      required this.images,
      required this.ratingsQuantity,
      required this.id,
      required this.title,
      required this.slug,
      required this.description,
      required this.quantity,
      required this.price,
      required this.imageCover,
      required this.category,
      required this.brand,
      required this.ratingsAverage,
        required this.priceAfterDiscount});
}
