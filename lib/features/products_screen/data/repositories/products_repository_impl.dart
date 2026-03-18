import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/Brand.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../main_layout/home/domain/entities/category_entity.dart';
@Singleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository{
  
  ProductsRemoteDataSource productsRemoteDataSource;
  ProductsRepositoryImpl({required this.productsRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({CategoryEntity? category, BrandEntity? brand}) async{
   try {
      var response = await productsRemoteDataSource.getProducts(
          category: category, brand: brand);
      return Right(response.products!
          .map((product) => product.toProductEntity())
          .toList());
    }on RemoteException catch(exception){
     return Left(Failure(message: exception.message));
   }
  }
  
}