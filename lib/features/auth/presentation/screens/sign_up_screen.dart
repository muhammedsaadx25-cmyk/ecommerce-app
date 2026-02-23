import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/ui_utils.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/data_sorces/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _nameController ;
  late TextEditingController _mobileController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _mobileController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  BuildTextField(
                    controller: _nameController,
                    backgroundColor: ColorManager.white,
                    hint: 'enter your full name',
                    label: 'Full Name',
                    textInputType: TextInputType.name,
                    validation: AppValidators.validateFullName,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    controller: _mobileController,
                    hint: 'enter your mobile no.',
                    backgroundColor: ColorManager.white,
                    label: 'Mobile Number',
                    validation: AppValidators.validatePhoneNumber,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    controller: _emailController,
                    hint: 'enter your email address',
                    backgroundColor: ColorManager.white,
                    label: 'E-mail address',
                    validation: AppValidators.validateEmail,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    controller: _passwordController,
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: AppSize.s50.h,
                  ),
                  Center(
                    child: BlocListener<AuthCubit, AuthState>(
                      listener: (context, state){
                        if(state is RegisterLoading){
                          UIUtils.showLoading(context);
                        } else  if(state is RegisterError){
                          UIUtils.hideDialog(context);
                          UIUtils.showToastMessage(message: state.message, bgColor: Colors.red, fgColor: Colors.white);
                        } else  if(state is RegisterSuccess){
                          UIUtils.hideDialog(context);
                          UIUtils.showToastMessage(message: "User Registered Successfully", bgColor: Colors.green, fgColor: Colors.white);
                          Navigator.pushReplacementNamed(context, Routes.mainRoute);
                        }
                      },
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          label: 'Sign Up',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary, fontSize: AppSize.s20),
                          onTap: (){
                            BlocProvider.of<AuthCubit>(context).register(RegisterRequest(name: _nameController.text, email: _emailController.text, phone: _mobileController.text, rePassword: _passwordController.text, password: _passwordController.text));
                          }
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have account ?',
                        style: getSemiBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(
                        width: AppSize.s8.w,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, Routes.signInRoute),
                        child: Text(
                          'Login',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void _createAccount() {
  //   if(_formKey.currentState?.validate() == false) return;
  //   print(_nameController.text);
  //   print(_mobileController.text);
  //   print(_emailController.text);
  //   print(_passwordController.text);
  // }
}
