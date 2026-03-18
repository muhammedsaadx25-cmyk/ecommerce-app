import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../main_layout/home/domain/entities/category_entity.dart';
@singleton
class GetProductsUseCase{
  ProductsRepository productsRepository;
  GetProductsUseCase({required this.productsRepository});

 Future<Either<Failure, List<ProductEntity>>> call({CategoryEntity? category, BrandEntity? brand}){
    return productsRepository.getProducts(category: category, brand: brand);
  }
}