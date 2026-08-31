import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/auth/register/register_screen.dart';
import 'features/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRouteName,
      routes: {
        AppRoutes.splashRouteName: (context) => const SplashScreen(),
        AppRoutes.loginRouteName: (context) => const LoginScreen(),
        AppRoutes.registerRouteName: (context) => const RegisterScreen(),
      },


    );
  }
}

