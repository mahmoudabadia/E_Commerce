import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/size_utils.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height =context.height;
    var width =context.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                Center(
                  child: Image.asset(
                    AppAssets.routeSplash,
                    height: height * 0.1,
                  ),
                ),
                SizedBox(height: height * 0.04),
                Text(
                  "Welcome Back To Route",
                  style: AppTextStyles.semiBold24White,
                ),
                SizedBox(height: height * 0.001),
                Text(
                  "Please sign in with your mail",
                  style: AppTextStyles.regular16White,
                ),
                SizedBox(height: height * 0.04),

                Text("User Name", style: AppTextStyles.semiBold18White),
                SizedBox(height: height * 0.01),
                CustomTextField(
                  hintStyle: AppTextStyles.regular14lightBlue,
                  hintText: "enter your name",
                  fillColor: AppColors.whiteColor,
                  fill: true,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  textStyle: AppTextStyles.regular14lightBlue,
                ),
                SizedBox(height: height * 0.06),

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
                SizedBox(height: height * 0.01),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password",
                    style: AppTextStyles.semiBold18White,
                  ),
                ),
                SizedBox(height: height * 0.06),

                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onPressed: () {},
                    verticalPadding: 16,
                    redius: 15,
                    child: Text("Login", style: AppTextStyles.semiBold20Blue),
                  ),
                ),
                SizedBox(height: height * 0.02),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.registerRouteName);
                    },
                    child: Text(
                      "Don’t have an account? Create Account",
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