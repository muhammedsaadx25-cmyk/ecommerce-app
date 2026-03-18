import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: CategoriesRemoteDataSource)
class CategoriesApiRemoteDataSource implements CategoriesRemoteDataSource{
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<CategoriesResponse> getCategories()async {
   try {
      var response = await dio.get(ApiConstants.categoriesEndPoint);
      CategoriesResponse categoriesResponse =
          CategoriesResponse.fromJson(response.data);
      return categoriesResponse;
    }catch(exception){
     String? message;
     if(exception is DioException){
       message = exception.response?.data['message'];
     }
     throw RemoteException(message: message ?? "Failed to get categories");
   }
  }
  
}