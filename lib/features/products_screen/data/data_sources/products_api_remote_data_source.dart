import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/products_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../main_layout/home/domain/entities/brand_entity.dart';
import '../../../main_layout/home/domain/entities/category_entity.dart';
import '../models/products_response/ProductsResponse.dart';
@Singleton(as: ProductsRemoteDataSource)
class ProductsApiRemoteDataSource implements ProductsRemoteDataSource{
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<ProductsResponse> getProducts({CategoryEntity? category, BrandEntity? brand}) async{
    Map<String,dynamic> params = {};
    if(category != null){
      params["category"] = category.id;
    }
    if(brand != null){
      params['brand'] = brand;
    }
    try{
      var response = await dio.get(ApiConstants.productsEndPoint,queryParameters: params);
      return ProductsResponse.fromJson(response.data);
    }catch(exception){
      print("Exceptiooooooooooon\n\n\n:${exception.toString()}");
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? "Failed to get Products");
    }
  }
  
}