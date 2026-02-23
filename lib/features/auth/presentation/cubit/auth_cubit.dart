import 'package:ecommerce_app/features/auth/data_sorces/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit({required this.authRepository}):super(AuthInitial());
  AuthRepository authRepository;
  void  register(RegisterRequest request)async{
   try {
      emit(RegisterLoading());

      await authRepository.register(request);
      emit(RegisterSuccess());
    }catch(exception){
     print("Exception is: ${exception.toString()}");
     emit(RegisterError(message: exception.toString()));
   }
  }

  void login(LoginRequest request)async{
    try{
      emit(LoginLoading());
      await authRepository.login(request);
      emit(LoginSuccess());
    }catch(exception){
      emit(LoginError(message: exception.toString()));
    }
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