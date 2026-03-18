import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data_sorces/local/auth_local_datasource.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/User.dart';
import 'package:ecommerce_app/features/auth/data_sorces/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;
  AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, UserEntity>> register(RegisterRequest request) async {
    try{
      var response = await remoteDataSource.register(request);
      await localDataSource.saveToken(response.token!);

      return Right(response.user!.toUserEntity());
    } on AppException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(LoginRequest request)async {
    try{
      var response = await remoteDataSource.login(request);
      await localDataSource.saveToken(response.token!);
      return Right(response.user!.toUserEntity());
    }on AppException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }
}
