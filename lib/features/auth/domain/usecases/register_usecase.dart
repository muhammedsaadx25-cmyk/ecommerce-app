import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/user_entity.dart';
@singleton
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  Future<Either<Failure, UserEntity>> call(RegisterRequest request){
    return authRepository.register(request);
  }
}