import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/brands_remote_data_osurce.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/BrandsResponse.dart';
import 'package:injectable/injectable.dart';
@Singleton(as:  BrandsRemoteDataSource)
class BrandsApiRemoteDataSource implements BrandsRemoteDataSource{
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  @override
  Future<BrandsResponse> getBrands()async {
   try {
      var response = await dio.get(ApiConstants.brandsEndPoint);
      BrandsResponse brandsResponse = BrandsResponse.fromJson(response.data);
      return brandsResponse;
    }catch(exception){
     String? message;
     if(exception is DioException){
       message = exception.response?.data["message"];
     }
     throw RemoteException(message: message ?? "Failed to get brands" );
   }
  }
  
}