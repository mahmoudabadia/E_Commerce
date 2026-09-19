import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/my_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' ;

import 'features/auth/ui/login/login_screen.dart';
import 'features/auth/ui/register/register_screen.dart';
import 'features/splash/splash_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  configureDependencies();
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
        AppRoutes.splashRouteName: (context) =>  SplashScreen(),
        AppRoutes.loginRouteName: (context) =>  LoginScreen(),
        AppRoutes.registerRouteName: (context) =>  RegisterScreen(),
      },
    );
  }
}
