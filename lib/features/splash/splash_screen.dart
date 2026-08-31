import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/size_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, AppRoutes.loginRouteName);
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Image.asset(AppAssets.categoryBeauty),
          SizedBox(height: height * 0.06),
          Image.asset(AppAssets.routeSplash),
          SizedBox(height: height * 0.07),
          Image.asset(AppAssets.categoryFashion),
        ],
      ),
    );
  }
}
