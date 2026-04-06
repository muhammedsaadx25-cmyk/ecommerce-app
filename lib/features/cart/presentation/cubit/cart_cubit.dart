import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/delete_product_from_cart_usecase.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/update_product_quantity_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class CartCubit extends Cubit<CartState>{
  CartCubit({
    required this.addToCartUseCase, required this.getCartUseCase,
    required this.updateProductQuantityUseCase,
    required this.deleteProductItemUseCase
}):super(CartInitial());

  AddToCartUseCase addToCartUseCase;
  GetCartUseCase getCartUseCase;
  UpdateProductQuantityUseCase updateProductQuantityUseCase;
  DeleteProductItemUseCase deleteProductItemUseCase;
  late CartEntity cart;
  void addToCart({required String productId})async{
    emit(AddToCartLoading());
    var result = await addToCartUseCase(productId:productId );
    result.fold((failure){
      emit(AddToCartError(message: failure.message));
    }, (_){
      emit(AddToCartSuccess());
    });
  }

  void getCart()async{
    emit(GetCartLoading());
    var result = await getCartUseCase();
    result.fold((failure){
      emit(GetCartError(message: failure.message));
    }, (cartEntity){
      cart = cartEntity;
      emit(GetCartSuccess());
    });
  }

  void updateProductQuantity({required String productId, required String quantity})async{
    emit(UpdateProductQuantityLoading());
    var result = await updateProductQuantityUseCase(productId: productId, quantity: quantity);
    result.fold((failure){
      emit(UpdateProductQuantityError(message: failure.message));
    }, (cartEntity){
      cart = cartEntity;
      emit(UpdateProductQuantitySuccess());
    });

  }

  void deleteFromCart({required String productId})async{
    emit(DeleteFromCartLoading());
    var result = await deleteProductItemUseCase(productId: productId);
    result.fold((failure){
      emit(DeleteFromCartError(message: failure.message));
    }, (cartEntity){
      cart = cartEntity;
      emit(DeleteFromCartSuccess());
    });
  }
}

abstract class CartState{}
class CartInitial extends CartState{}

class AddToCartLoading extends CartState{}
class AddToCartSuccess extends CartState{}
class AddToCartError extends CartState{
  String message;
  AddToCartError({required this.message});
}

class GetCartLoading extends CartState{}
class GetCartSuccess extends CartState{}
class GetCartError extends CartState{
  String message;
  GetCartError({required this.message});
}

class UpdateProductQuantityLoading extends CartState{}
class UpdateProductQuantitySuccess extends CartState{}
class UpdateProductQuantityError extends CartState{
  String message;
  UpdateProductQuantityError({required this.message});
}


class DeleteFromCartLoading extends CartState{}

class DeleteFromCartSuccess extends CartState{}
class DeleteFromCartError extends CartState{
  String message;
  DeleteFromCartError({required this.message});
}