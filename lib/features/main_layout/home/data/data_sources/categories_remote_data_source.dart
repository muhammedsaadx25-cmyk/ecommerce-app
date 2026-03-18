import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response/CategoriesResponse.dart';

abstract class CategoriesRemoteDataSource{
  Future<CategoriesResponse>getCategories();
}