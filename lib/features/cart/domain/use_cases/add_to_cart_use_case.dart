import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddToCartUseCase{
  CartRepository cartRepository;
  AddToCartUseCase({required this.cartRepository});
 Future<Either<Failure, void>> call({required String productId}){
    return cartRepository.addToCart(productId: productId);
  }
}