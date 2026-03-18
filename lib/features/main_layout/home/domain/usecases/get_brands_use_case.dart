import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/brands_repository.dart';
import 'package:injectable/injectable.dart';


@singleton
class GetBrandsUSeCase{
  BrandsRepository brandsRepository;
  GetBrandsUSeCase({required this.brandsRepository});

  Future<Either<Failure, List<BrandEntity>>> call(){
    return brandsRepository.getBrands();
  }
}