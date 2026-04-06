import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCartUseCase{
  CartRepository cartRepository;
  GetCartUseCase({required this.cartRepository});
  Future<Either<Failure, CartEntity>>call(){
    return cartRepository.getCart();
  }
}