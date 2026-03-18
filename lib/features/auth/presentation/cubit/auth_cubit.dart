import 'package:ecommerce_app/features/auth/data_sorces/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class AuthCubit extends Cubit<AuthState>{
  AuthCubit({required this.registerUseCase, required this.loginUseCase}):super(AuthInitial());
  RegisterUseCase  registerUseCase;
  LoginUseCase loginUseCase;
  void  register(RegisterRequest request)async{

      emit(RegisterLoading());
     var result =  await registerUseCase(request);
      result.fold((failure){
        emit(RegisterError(message: failure.message));
      }, (user){
        emit(RegisterSuccess());
      });
    }


  void login(LoginRequest request)async{
    emit(LoginLoading());
    var result = await loginUseCase(request);
    result.fold((failure){
      emit(LoginError(message: failure.message));
    }, (user){
      emit(LoginSuccess());
    });

  }

}
abstract class AuthState{}
class AuthInitial extends AuthState{}
class RegisterLoading extends AuthState{}
class RegisterSuccess extends AuthState{}
class RegisterError extends AuthState{
  String message;
  RegisterError({required this.message});
}


class LoginLoading extends AuthState{}
class LoginSuccess extends AuthState{}
class LoginError extends AuthState{
  String message;
  LoginError({required this.message});
}