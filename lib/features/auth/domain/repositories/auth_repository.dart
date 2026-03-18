

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/User.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository{
  Future<Either<Failure, UserEntity>> register(RegisterRequest request);
  Future<Either<Failure, UserEntity>> login(LoginRequest request);

}