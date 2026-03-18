import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/get_brands_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class BrandsCubit extends Cubit<BrandsState>{
  BrandsCubit({required this.getBrandsUseCase}):super(BrandsInitial());
  GetBrandsUSeCase getBrandsUseCase;

 void  getBrands()async{
    emit(BrandsLoading());
    var result = await getBrandsUseCase();
    result.fold((failure){
      emit(BrandsError(message: failure.message));
    }, (brands){
      emit(BrandsSuccess(brands: brands));
    });
  }
}

abstract class BrandsState{}
class BrandsInitial extends BrandsState{}
class BrandsLoading extends BrandsState{}
class BrandsSuccess extends BrandsState{
  List<BrandEntity> brands;
  BrandsSuccess({required this.brands});
}
class BrandsError extends BrandsState{
  String message;
  BrandsError({required this.message});
}