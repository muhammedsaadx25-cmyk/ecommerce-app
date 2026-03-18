import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/get_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class CategoriesCubit extends Cubit<CategoriesState>{
  CategoriesCubit({required this.getCategoriesUseCase}):super(CategoriesInitial());
  GetCategoriesUseCase getCategoriesUseCase;
 void  getCategories()async{
    emit(CategoriesLoading());
    var result = await getCategoriesUseCase();
    result.fold((failure){
      emit(CategoriesError(message: failure.message));
    }, (categories){
      emit(CategoriesSuccess(categories: categories));
    });
  }

}

abstract class CategoriesState{}
class CategoriesInitial extends CategoriesState{}
class CategoriesLoading extends CategoriesState{}
class CategoriesSuccess extends CategoriesState{
  List<CategoryEntity> categories;
  CategoriesSuccess({required this.categories});
}

class CategoriesError extends CategoriesState{
  String message;
  CategoriesError({required this.message});
}