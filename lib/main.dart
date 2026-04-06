import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/auth/data_sorces/local/auth_shared_prefs_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data_sorces/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/routes_manager/route_generator.dart';

void main() {
  configureDependencies();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> getIt<AuthCubit>()),
        BlocProvider(create: (context)=> getIt<CartCubit>()),
      ],
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.signUpRoute,
      ),
    );
  }
}
