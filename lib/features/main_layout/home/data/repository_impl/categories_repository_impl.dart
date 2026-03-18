import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository{
  CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesRepositoryImpl({required this.categoriesRemoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async{
    try{
      var response = await categoriesRemoteDataSource.getCategories();
      return Right(response.categories!.map((category)=> category.toCategoryEntity()).toList());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

}