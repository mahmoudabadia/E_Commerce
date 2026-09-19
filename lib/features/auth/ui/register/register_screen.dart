import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/utils/toast_utilis.dart';
import 'package:e_commerce_app/features/auth/ui/register/cubit/register_cubit.dart';
import 'package:e_commerce_app/features/auth/ui/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController rePasswordController;
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final GlobalKey<FormState> formKey;
  late final RegisterCubit cubit;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    cubit = getIt<RegisterCubit>();

    emailController = TextEditingController(text: "mahmoud@gmail.com");
    passwordController = TextEditingController(text: "123456");
    rePasswordController = TextEditingController(text: "123456");
    nameController = TextEditingController(text: "Mahmoud Mohamed");
    phoneController = TextEditingController(text: "01009931572");
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;

    return BlocListener<RegisterCubit, RegisterStates>(
      bloc: cubit,
      listener: (context, state) {
        if (state.registerState.isSuccess) {
          ToastUtils.showCustomToast(
            context: context,
            message: "Register Successfully",
            backgroundColor: AppColors.greenColor,
            textColor: AppColors.whiteColor,
          );
        } else if (state.registerState.isError) {
          ToastUtils.showCustomToast(
            context: context,
            message: state.registerState.message ?? "",
            backgroundColor: AppColors.redColor,
            textColor: AppColors.whiteColor,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.04),
                    Center(
                      child: Image.asset(
                        AppAssets.routeSplash,
                        height: height * 0.1,
                      ),
                    ),
                    SizedBox(height: height * 0.08),
                    Text("Full Name", style: AppTextStyles.semiBold18White),
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                      controller: nameController,
                      hintStyle: AppTextStyles.regular14lightBlue,
                      hintText: "enter your full name",
                      fillColor: AppColors.whiteColor,
                      fill: true,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      textStyle: AppTextStyles.regular14lightBlue,
                    ),
                    SizedBox(height: height * 0.04),
                    Text("Mobile Number", style: AppTextStyles.semiBold18White),
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                      controller: phoneController,
                      hintStyle: AppTextStyles.regular14lightBlue,
                      hintText: "enter your mobile no.",
                      fillColor: AppColors.whiteColor,
                      fill: true,
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                      textStyle: AppTextStyles.regular14lightBlue,
                    ),
                    SizedBox(height: height * 0.04),
                    Text("E-mail address", style: AppTextStyles.semiBold18White),
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                      controller: emailController,
                      hintStyle: AppTextStyles.regular14lightBlue,
                      hintText: "enter your email address",
                      fillColor: AppColors.whiteColor,
                      fill: true,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      textStyle: AppTextStyles.regular14lightBlue,
                    ),
                    SizedBox(height: height * 0.04),
                    Text("Password", style: AppTextStyles.semiBold18White),
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                      controller: passwordController,
                      hintStyle: AppTextStyles.regular14lightBlue,
                      hintText: "enter your password",
                      fillColor: AppColors.whiteColor,
                      fill: true,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      textStyle: AppTextStyles.regular14lightBlue,
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: AppColors.lightBlueColor,
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    Text("Re Password", style: AppTextStyles.semiBold18White),
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                      controller: rePasswordController,
                      hintStyle: AppTextStyles.regular14lightBlue,
                      hintText: "rePassword",
                      fillColor: AppColors.whiteColor,
                      fill: true,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      textStyle: AppTextStyles.regular14lightBlue,
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: AppColors.lightBlueColor,
                      ),
                    ),
                    SizedBox(height: height * 0.06),
                    SizedBox(
                      width: double.infinity,
                      child: BlocBuilder<RegisterCubit, RegisterStates>(
                        bloc: cubit,
                        builder: (context, state) {
                          if (!state.registerState.isLoading) {
                            return CustomElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.register(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    rePassword: rePasswordController.text,
                                  );
                                }
                              },
                              verticalPadding: 16,
                              redius: 15,
                              child: Text(
                                "SignUp",
                                style: AppTextStyles.semiBold20Blue,
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: AppColors.whiteColor,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context, AppRoutes.loginRouteName);
                        },
                        child: Text(
                          "Already have an account? Login",
                          style: AppTextStyles.semiBold18White,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}