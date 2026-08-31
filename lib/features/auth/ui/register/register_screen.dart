import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height =context.height;


    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
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
                SizedBox(height: height * 0.06),

                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onPressed: () {},
                    verticalPadding: 16,
                    redius: 15,
                    child: Text("Sign up", style: AppTextStyles.semiBold20Blue),
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
    );
  }
}