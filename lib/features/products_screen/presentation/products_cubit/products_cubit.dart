import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/usecases/get_Products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../main_layout/home/domain/entities/category_entity.dart';

@singleton
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.getProductsUseCase}) :super(ProductsInitial());
  GetProductsUseCase getProductsUseCase;

  void getProducts({CategoryEntity? category, BrandEntity? brand}) async {
    emit(ProductsLoading());
    var result = await getProductsUseCase(category: category, brand: brand);
    result.fold((failure) {
      emit(ProductsError(message: failure.message));
    }, (products) {
      emit(ProductsSuccess(products: products));
    }


  );
}}

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {
}

class ProductsSuccess extends ProductsState {
  List<ProductEntity> products;

  ProductsSuccess({required this.products});
}

class ProductsError extends ProductsState {
  String message;

  ProductsError({required this.message});
}