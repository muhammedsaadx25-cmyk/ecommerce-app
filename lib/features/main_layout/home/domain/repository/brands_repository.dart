import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';

abstract class BrandsRepository{
  Future<Either<Failure, List<BrandEntity>>>getBrands();
}