import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/ui_utils.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
   ProductDetails({super.key,required this.product});
ProductEntity product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
             ProductSlider(items: [
              ProductItem(
                imageUrl: widget.product.images![0],
              ),
              ProductItem(
                imageUrl: widget.product.images![1],
              ),
              ProductItem(
                imageUrl:widget.product.images![2],
              )
            ], initialIndex: 0),
            SizedBox(
              height: 24.h,
            ),
             ProductLabel(
                productName:widget.product.title ?? '', productPrice: '${widget.product.priceAfterDiscount ?? widget.product.price}'),
            SizedBox(
              height: 16.h,
            ),
             ProductRating(
               increment: (_){

                 setState(() {
                   quantity++;
                 });
               },
                 decrement: (_){
                 if(quantity <= 1){
                   quantity = 1;
                 }else{

                 quantity--;
                 }

                 setState(() {

                 });
                 },
                 quantity: quantity,
                productBuyers: '${widget.product.sold}', productRating: '${widget.product.ratingsAverage} (${widget.product.ratingsQuantity})'),
            SizedBox(
              height: 16.h,
            ),
             ProductDescription(
                productDescription: widget.product.description ?? ''),
            ProductSize(
              size: const [35, 38, 39, 40],
              onSelected: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            Text('Color',
                style: getMediumStyle(color: ColorManager.appBarTitleColor)
                    .copyWith(fontSize: 18.sp)),
            ProductColor(color: const [
              Colors.red,
              Colors.blueAccent,
              Colors.green,
              Colors.yellow,
            ], onSelected: () {}),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: getMediumStyle(
                              color: ColorManager.primary.withOpacity(.6))
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text('${(widget.product.priceAfterDiscount ?? widget.product.price)! * quantity}',
                        style:
                            getMediumStyle(color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp))
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: BlocListener<CartCubit, CartState>(
                    listener: (context, state){
                      if(state is AddToCartLoading){
                        UIUtils.showLoading(context);
                      }else if(state is AddToCartError){
                        print("Error When adding product to cart\n\n\n\n");
                        print(state.message);
                        UIUtils.hideDialog(context);
                        UIUtils.showToastMessage(message: state.message, bgColor: Colors.red, fgColor: Colors.white);
                      }else if(state is AddToCartSuccess){
                        UIUtils.hideDialog(context);
                        UIUtils.showToastMessage(message: "Product Added Successfully", bgColor: Colors.green, fgColor: Colors.white);
                      Navigator.pushNamed(context, Routes.cartRoute);
                      }
                    },
                    child: CustomElevatedButton(
                      label: 'Add to cart',
                      onTap: () {
                        BlocProvider.of<CartCubit>(context).addToCart(productId: widget.product.id!);
                      },
                      prefixIcon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
