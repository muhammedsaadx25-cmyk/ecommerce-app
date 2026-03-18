import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data_sorces/remote/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  Dio dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
  ));

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      var serverResponse =
          await dio.post(ApiConstants.registerEndPoint, data: request.toJson());
      var json = serverResponse.data;
      RegisterResponse registerResponse = RegisterResponse.fromJson(json);
      return registerResponse;
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? "Failed to register");
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      var serverResponse =
          await dio.post(ApiConstants.loginEndPoint, data: request.toJson());
      var json = serverResponse.data;
      LoginResponse loginResponse = LoginResponse.fromJson(json);
      return loginResponse;
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? "Failed to login");
    }
  }
}
