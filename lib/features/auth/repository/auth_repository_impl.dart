import 'package:ecommerce_app/features/auth/data_sorces/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data_sorces/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
AuthRemoteDataSource remoteDataSource;
AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<RegisterResponse> register(RegisterRequest request) {
    return remoteDataSource.register(request);
  }
  @override
  Future<LoginResponse> login(LoginRequest request) {
    return remoteDataSource.login(request);
  }


}