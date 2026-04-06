import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data_sorces/local/auth_shared_prefs_local_data_source.dart';
import 'package:ecommerce_app/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, void>> addToCart(
      {required String productId}) async {
    try {
      AuthSharedPrefsLocalDataSource sharedPrefsLocalDataSource = AuthSharedPrefsLocalDataSource();
      String token = await sharedPrefsLocalDataSource.getToken();
      var response = await cartRemoteDataSource.addToCart(
          productId: productId, token: token);
      return Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      AuthSharedPrefsLocalDataSource sharedPrefsLocalDataSource = AuthSharedPrefsLocalDataSource();
      String token = await sharedPrefsLocalDataSource.getToken();
      var response = await cartRemoteDataSource.getCart(token: token);
      return Right(response.cart!.toCartEntity());
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> deleteProductFromCart(
      {required String productId}) async {
    try {
      AuthSharedPrefsLocalDataSource sharedPrefsLocalDataSource = AuthSharedPrefsLocalDataSource();
      String token = await sharedPrefsLocalDataSource.getToken();
      var response = await cartRemoteDataSource.deleteProductFromCart(
          productId: productId, token: token);
      return Right(response.cart!.toCartEntity());
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> updateProductQuantity(
      {required String productId,
      required String quantity,
     }) async {
    try {
      AuthSharedPrefsLocalDataSource sharedPrefsLocalDataSource = AuthSharedPrefsLocalDataSource();
      String token = await sharedPrefsLocalDataSource.getToken();
      var response = await cartRemoteDataSource.updateProductQuantity(
          productId: productId, quantity: quantity, token: token);
      return Right(response.cart!.toCartEntity());
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
