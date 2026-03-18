import 'dart:async';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/categories_api_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repository_impl/categories_repository_impl.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/get_categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/brands_cubit/brands_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/categories_cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;
  late CategoriesCubit categoriesCubit;
  late BrandsCubit brandsCubit;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
    categoriesCubit = getIt<CategoriesCubit>();
    brandsCubit = getIt<BrandsCubit>();

  categoriesCubit.getCategories();
  brandsCubit.getBrands();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAdsWidget(
            adsImages: adsImages,
            currentIndex: _currentIndex,
            timer: _timer,
          ),
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: categoriesCubit),
              BlocProvider.value(value: brandsCubit),
            ],
            child: Column(
              children: [
                CustomSectionBar(sectionNname: 'Categories', function: () {}),
                BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state){
                    if(state is CategoriesLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }else if(state is CategoriesError){
                      return Center(
                        child: Text(state.message, style: TextStyle(color: Colors.black),),
                      );
                    }else if(state is CategoriesSuccess){
                      return SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return  CustomCategoryWidget(category: state.categories[index],);
                          },
                          itemCount: state.categories.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      );
                    }
                    return Container();
                  },

                ),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionNname: 'Brands', function: () {}),
                SizedBox(height: 12.h),
                BlocBuilder<BrandsCubit, BrandsState>(
                    builder: (context, state){
                      if( state is BrandsLoading){
                        return Center(child: CircularProgressIndicator(),);
                      }else if(state is BrandsError){
                        return Center(child: Text(state.message),);
                      }else if(state is BrandsSuccess){
                        return   SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return  CustomBrandWidget(brand: state.brands[index],);
                            },
                            itemCount: state.brands.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        );
                      }
                      return Container();
                    },)



                // CustomSectionBar(
                //   sectionNname: 'Most Selling Products',
                //   function: () {},
                // ),
                // SizedBox(
                //   child: SizedBox(
                //     height: 360.h,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return const ProductCard(
                //           title: "Nike Air Jordon",
                //           description:
                //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                //           rating: 4.5,
                //           price: 1100,
                //           priceBeforeDiscound: 1500,
                //           image: ImageAssets.categoryHomeImage,
                //         );
                //       },
                //       itemCount: 20,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 12.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
