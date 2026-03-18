import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response/category.dart' ;
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/products_screen/presentation/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatefulWidget {
   ProductsScreen({super.key, required this.category});
CategoryEntity category;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
 late  ProductsCubit productsCubit ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productsCubit = getIt<ProductsCubit>();
    productsCubit.getProducts(category: widget.category);
  }
  @override
  Widget build(BuildContext context) {
    print(widget.category.id);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocProvider.value(
        value:productsCubit ,
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state){
                    if(state is ProductsLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }else if(state is ProductsError){
                      return Center(child: Text(state.message),);
                    }else if(state is ProductsSuccess){
                      return GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 7 / 10,
                        ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                           product: state.products[index],
                            height: height,
                            width: width,
                          );
                        },
                        scrollDirection: Axis.vertical,
                      );
                    }
                    return Container();
                  },

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
