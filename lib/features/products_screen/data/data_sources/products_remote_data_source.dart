import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/Brand.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_response/ProductsResponse.dart';

import '../../../main_layout/home/domain/entities/category_entity.dart';

abstract class ProductsRemoteDataSource{
 Future<ProductsResponse> getProducts({CategoryEntity? category, BrandEntity? brand});
}