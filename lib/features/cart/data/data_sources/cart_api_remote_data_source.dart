import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/data/models/CartResponse.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartApiRemoteDataSource implements CartRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  @override
  Future<void> addToCart(
      {required String productId, required String token}) async {
   try {
      var response = await dio.post(ApiConstants.cartEndPoint,
          data: {"productId": productId},
          options: Options(headers: {"token": token}));
    }catch(exception){
     String? message;
     if(exception is DioException){
       message = exception.response?.data['message'];
     }
     throw RemoteException(message: message ?? "Failed to add product to cart");
   }
  }



  @override
  Future<CartResponse> getCart({required String token}) async{
    try{
      var response = await dio.get(ApiConstants.cartEndPoint,
          options: Options(headers: {"token": token}));
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return cartResponse;
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      print("Exception when getting cart\n\n\n");
      print(exception.toString());
      throw RemoteException(message: message ?? "Failed to get cart" );
    }
  }

  @override
  Future<CartResponse> deleteProductFromCart(
      {required String productId, required String token})async {
   try {
      var response = await dio.delete("${ApiConstants.cartEndPoint}/$productId",
          options: Options(headers: {"token": token}));
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return cartResponse;
    }catch(exception){
     String? message;
     if(exception is DioException){

       message = exception.response?.data['message'];
     }
     throw RemoteException(message: message ?? "Failed to delete cart item");
   }
  }

  @override
  Future<CartResponse> updateProductQuantity(
      {required String productId,
      required String quantity,
      required String token}) async{
   try {
      var response = await dio.put("${ApiConstants.cartEndPoint}/$productId",
          data: {'count': quantity},
          options: Options(headers: {'token': token}));
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return cartResponse;
    }catch(exception){
     String? message;
     if(exception is DioException){
       message = exception.response?.data['message'];
     }
     throw RemoteException(message: message ?? "Failed to update product quantity");
   }
  }
}
