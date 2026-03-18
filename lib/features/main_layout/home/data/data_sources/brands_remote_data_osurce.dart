import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/BrandsResponse.dart';

abstract class BrandsRemoteDataSource{
  Future<BrandsResponse>getBrands();
}