import 'package:ecommerce_app/features/auth/data_sorces/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterResponse.dart';

abstract class AuthRemoteDataSource{
 Future<RegisterResponse>register(RegisterRequest request);
  Future<LoginResponse>login(LoginRequest request);
}