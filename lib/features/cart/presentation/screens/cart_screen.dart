import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/ui_utils.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartCubit cartCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartCubit = BlocProvider.of<CartCubit>(context);
    cartCubit.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                IconsAssets.icSearch,
              ),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icCart),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if(state is DeleteFromCartLoading || state is UpdateProductQuantityLoading){
              UIUtils.showLoading(context);
            }else if(state is DeleteFromCartError){
              UIUtils.hideDialog(context);
              UIUtils.showToastMessage(message: state.message, bgColor: Colors.red, fgColor: Colors.white);
            }else if(state is DeleteFromCartSuccess || state is UpdateProductQuantitySuccess){
              UIUtils.hideDialog(context);
              UIUtils.showToastMessage(message: "Success", bgColor: Colors.green, fgColor: Colors.white);
            }else if(state is UpdateProductQuantityError){
              UIUtils.hideDialog(context);
              UIUtils.showToastMessage(message: state.message, bgColor: Colors.red, fgColor: Colors.white);

            }
          },
          builder: (context, state) {
            if (state is GetCartLoading) {
              return Center(child: CircularProgressIndicator(),);
            } else if (state is GetCartError) {
              return Center(child: Text(
                state.message, style: TextStyle(color: Colors.black),),);
            }
            return cartCubit.cart.cartItems!.isEmpty ? Center(child: Text(
              "Cart is Empty",
              style: TextStyle(color: Colors.black, fontSize: 24),),) :Column(
              children: [
                Expanded(
                  // the list of cart items ===============
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        CartItemWidget(
                          cartItemEntity: cartCubit.cart.cartItems![index],
                          imagePath: cartCubit.cart.cartItems![index].product!.imageCover!,
                          title: cartCubit.cart.cartItems![index].product!.title!,
                          price: cartCubit.cart.cartItems![index].price!,
                          quantity: cartCubit.cart.cartItems![index].count!,
                          onDeleteTap: () {},
                          onDecrementTap: (value) {
                           value--;
                            cartCubit.updateProductQuantity(productId: cartCubit.cart.cartItems![index].product!.id!, quantity: value.toString());
                          },
                          onIncrementTap: (value) {
                            value++;
                            cartCubit.updateProductQuantity(productId: cartCubit.cart.cartItems![index].product!.id!, quantity: value.toString());

                          },
                          size: 40,
                          color: Colors.black,
                          colorName: 'Black',
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSize.s12.h),
                    itemCount: cartCubit.cart.cartItems!.length,
                  ),
                ),
                // the total price and checkout button========
                TotalPriceAndCheckoutBotton(
                  totalPrice: cartCubit.cart.totalPrice!,
                  checkoutButtonOnTap: () {},
                ),
                SizedBox(height: 10.h),
              ],
            );
          },

        ),
      ),
    );
  }
}
