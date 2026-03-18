import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data_sorces/local/auth_local_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@Singleton(as:AuthLocalDataSource)
class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource{


  @override
  Future<void> saveToken(String token) async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(CacheConstant.tokenKey, token);
    }catch(exception){
      throw LocalException(message: "Failed to save token");
    }
  }
  @override
  Future<String> getToken()async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(CacheConstant.tokenKey)!;
    }catch(exception){
      throw LocalException(message: "Failed to get token");
    }
  }


}