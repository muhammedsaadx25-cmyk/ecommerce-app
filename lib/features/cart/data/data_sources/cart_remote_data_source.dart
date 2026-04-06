import 'package:ecommerce_app/features/cart/data/models/CartResponse.dart';

abstract class CartRemoteDataSource{
Future<void>addToCart({required String productId, required String token});
Future<CartResponse>getCart({required String token});
Future<CartResponse>deleteProductFromCart({required String productId, required String token});
Future<CartResponse>updateProductQuantity({required String productId, required String quantity, required String token});

}