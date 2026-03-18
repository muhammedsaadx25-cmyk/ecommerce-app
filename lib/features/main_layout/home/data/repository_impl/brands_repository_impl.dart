import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/brands_remote_data_osurce.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/brands_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as:BrandsRepository )
class BrandsRepositoryImpl implements BrandsRepository{
  BrandsRemoteDataSource brandsRemoteDataSource;
  BrandsRepositoryImpl({required this.brandsRemoteDataSource});

  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands()async {
    try{
      var response = await brandsRemoteDataSource.getBrands();
      return Right(
          response.brands!.map((brand) => brand.toBrandEntity()).toList());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }
}