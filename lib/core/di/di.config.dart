// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/features/auth/data_sorces/local/auth_local_datasource.dart'
    as _i339;
import 'package:ecommerce_app/features/auth/data_sorces/local/auth_shared_prefs_local_data_source.dart'
    as _i712;
import 'package:ecommerce_app/features/auth/data_sorces/remote/auth_api_remote_data_source.dart'
    as _i1061;
import 'package:ecommerce_app/features/auth/data_sorces/remote/auth_remote_data_source.dart'
    as _i688;
import 'package:ecommerce_app/features/auth/data_sorces/repository/auth_repository_impl.dart'
    as _i427;
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart'
    as _i804;
import 'package:ecommerce_app/features/auth/domain/usecases/login_usecase.dart'
    as _i962;
import 'package:ecommerce_app/features/auth/domain/usecases/register_usecase.dart'
    as _i948;
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i118;
import 'package:ecommerce_app/features/cart/data/data_sources/cart_api_remote_data_source.dart'
    as _i570;
import 'package:ecommerce_app/features/cart/data/data_sources/cart_remote_data_source.dart'
    as _i1035;
import 'package:ecommerce_app/features/cart/data/repositories/cart_repository_impl.dart'
    as _i84;
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart'
    as _i182;
import 'package:ecommerce_app/features/cart/domain/use_cases/add_to_cart_use_case.dart'
    as _i350;
import 'package:ecommerce_app/features/cart/domain/use_cases/delete_product_from_cart_usecase.dart'
    as _i255;
import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart_use_case.dart'
    as _i901;
import 'package:ecommerce_app/features/cart/domain/use_cases/update_product_quantity_usecase.dart'
    as _i874;
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart'
    as _i390;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/brands_api_remote_data_source.dart'
    as _i331;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/brands_remote_data_osurce.dart'
    as _i928;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/categories_api_remote_data_source.dart'
    as _i999;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/categories_remote_data_source.dart'
    as _i582;
import 'package:ecommerce_app/features/main_layout/home/data/repository_impl/brands_repository_impl.dart'
    as _i499;
import 'package:ecommerce_app/features/main_layout/home/data/repository_impl/categories_repository_impl.dart'
    as _i685;
import 'package:ecommerce_app/features/main_layout/home/domain/repository/brands_repository.dart'
    as _i601;
import 'package:ecommerce_app/features/main_layout/home/domain/repository/categories_repository.dart'
    as _i543;
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/get_brands_use_case.dart'
    as _i660;
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/get_categories_use_case.dart'
    as _i777;
import 'package:ecommerce_app/features/main_layout/home/presentation/brands_cubit/brands_cubit.dart'
    as _i436;
import 'package:ecommerce_app/features/main_layout/home/presentation/categories_cubit/categories_cubit.dart'
    as _i8;
import 'package:ecommerce_app/features/products_screen/data/data_sources/products_api_remote_data_source.dart'
    as _i462;
import 'package:ecommerce_app/features/products_screen/data/data_sources/products_remote_data_source.dart'
    as _i291;
import 'package:ecommerce_app/features/products_screen/data/repositories/products_repository_impl.dart'
    as _i486;
import 'package:ecommerce_app/features/products_screen/domain/repositories/products_repository.dart'
    as _i981;
import 'package:ecommerce_app/features/products_screen/domain/usecases/get_Products_usecase.dart'
    as _i619;
import 'package:ecommerce_app/features/products_screen/presentation/products_cubit/products_cubit.dart'
    as _i1057;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i291.ProductsRemoteDataSource>(
        () => _i462.ProductsApiRemoteDataSource());
    gh.singleton<_i688.AuthRemoteDataSource>(
        () => _i1061.AuthApiRemoteDataSource());
    gh.lazySingleton<_i1035.CartRemoteDataSource>(
        () => _i570.CartApiRemoteDataSource());
    gh.singleton<_i582.CategoriesRemoteDataSource>(
        () => _i999.CategoriesApiRemoteDataSource());
    gh.singleton<_i339.AuthLocalDataSource>(
        () => _i712.AuthSharedPrefsLocalDataSource());
    gh.singleton<_i928.BrandsRemoteDataSource>(
        () => _i331.BrandsApiRemoteDataSource());
    gh.singleton<_i543.CategoriesRepository>(() =>
        _i685.CategoriesRepositoryImpl(
            categoriesRemoteDataSource:
                gh<_i582.CategoriesRemoteDataSource>()));
    gh.singleton<_i981.ProductsRepository>(() => _i486.ProductsRepositoryImpl(
        productsRemoteDataSource: gh<_i291.ProductsRemoteDataSource>()));
    gh.singleton<_i804.AuthRepository>(() => _i427.AuthRepositoryImpl(
          remoteDataSource: gh<_i688.AuthRemoteDataSource>(),
          localDataSource: gh<_i339.AuthLocalDataSource>(),
        ));
    gh.singleton<_i601.BrandsRepository>(() => _i499.BrandsRepositoryImpl(
        brandsRemoteDataSource: gh<_i928.BrandsRemoteDataSource>()));
    gh.singleton<_i962.LoginUseCase>(
        () => _i962.LoginUseCase(authRepository: gh<_i804.AuthRepository>()));
    gh.singleton<_i948.RegisterUseCase>(() =>
        _i948.RegisterUseCase(authRepository: gh<_i804.AuthRepository>()));
    gh.lazySingleton<_i182.CartRepository>(() => _i84.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i1035.CartRemoteDataSource>()));
    gh.singleton<_i118.AuthCubit>(() => _i118.AuthCubit(
          registerUseCase: gh<_i948.RegisterUseCase>(),
          loginUseCase: gh<_i962.LoginUseCase>(),
        ));
    gh.singleton<_i660.GetBrandsUSeCase>(() =>
        _i660.GetBrandsUSeCase(brandsRepository: gh<_i601.BrandsRepository>()));
    gh.singleton<_i777.GetCategoriesUseCase>(() => _i777.GetCategoriesUseCase(
        categoriesRepository: gh<_i543.CategoriesRepository>()));
    gh.singleton<_i436.BrandsCubit>(() =>
        _i436.BrandsCubit(getBrandsUseCase: gh<_i660.GetBrandsUSeCase>()));
    gh.singleton<_i619.GetProductsUseCase>(() => _i619.GetProductsUseCase(
        productsRepository: gh<_i981.ProductsRepository>()));
    gh.singleton<_i1057.ProductsCubit>(() => _i1057.ProductsCubit(
        getProductsUseCase: gh<_i619.GetProductsUseCase>()));
    gh.lazySingleton<_i350.AddToCartUseCase>(() =>
        _i350.AddToCartUseCase(cartRepository: gh<_i182.CartRepository>()));
    gh.lazySingleton<_i255.DeleteProductItemUseCase>(() =>
        _i255.DeleteProductItemUseCase(
            cartRepository: gh<_i182.CartRepository>()));
    gh.lazySingleton<_i901.GetCartUseCase>(
        () => _i901.GetCartUseCase(cartRepository: gh<_i182.CartRepository>()));
    gh.lazySingleton<_i874.UpdateProductQuantityUseCase>(() =>
        _i874.UpdateProductQuantityUseCase(
            cartRepository: gh<_i182.CartRepository>()));
    gh.singleton<_i8.CategoriesCubit>(() => _i8.CategoriesCubit(
        getCategoriesUseCase: gh<_i777.GetCategoriesUseCase>()));
    gh.lazySingleton<_i390.CartCubit>(() => _i390.CartCubit(
          addToCartUseCase: gh<_i350.AddToCartUseCase>(),
          getCartUseCase: gh<_i901.GetCartUseCase>(),
          updateProductQuantityUseCase:
              gh<_i874.UpdateProductQuantityUseCase>(),
          deleteProductItemUseCase: gh<_i255.DeleteProductItemUseCase>(),
        ));
    return this;
  }
}
