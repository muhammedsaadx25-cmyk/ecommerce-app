
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/Brand.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';

import '../../../main_layout/home/domain/entities/brand_entity.dart';
import '../../../main_layout/home/domain/entities/category_entity.dart';

abstract class ProductsRepository{
  Future<Either<Failure, List<ProductEntity>>> getProducts({CategoryEntity? category, BrandEntity? brand});
}