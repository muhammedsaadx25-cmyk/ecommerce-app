import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/category_entity.dart';
@singleton
class GetCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  GetCategoriesUseCase({required this.categoriesRepository});

  Future<Either<Failure, List<CategoryEntity>>> call(){
 return categoriesRepository.getCategories();
}
}