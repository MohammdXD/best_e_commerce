import 'package:best_e_commerce/Moudel/Proudect_API.dart';
import 'package:best_e_commerce/Provider/favorit_provider.dart';
import 'package:best_e_commerce/Screens/CompleteProfile.dart';
import 'package:best_e_commerce/Screens/Detales_Product.dart';
import 'package:best_e_commerce/Screens/ForgotPassword.dart';
import 'package:best_e_commerce/Screens/Login.dart';
import 'package:best_e_commerce/Screens/OTP.dart';
import 'package:best_e_commerce/Screens/Product.dart';
import 'package:best_e_commerce/Screens/Register.dart';
import 'package:best_e_commerce/Screens/Splash.dart';
import 'package:best_e_commerce/Screens/Main_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: E_commerce(),
    ),
  );
}

class Routes {
  static String register = 'register';
  static String splash = 'splash';
  static String completeProfile = 'completeprofile';
  static String otp = 'otp';
  static String login = 'login';
  static String forgotPassword = 'forgotPassword';
  static String home = 'home';
  static String details_product = 'details_product';
}

class E_commerce extends StatelessWidget {
  const E_commerce({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        routes: {
          Routes.register: (context) => Register_Screen(),
          Routes.splash: (context) => Splash_Scrren(),
          Routes.completeProfile: (context) => Completeprofile(),
          Routes.otp: (context) => Otp(),
          Routes.login: (context) => Login_Screen(),
          Routes.forgotPassword: (context) => Forgotpassword(),
          Routes.home: (context) => MainScreen(),
          Routes.details_product: (context) {
            final product =
                ModalRoute.of(context)!.settings.arguments as ProudectApi;
            return Detales_Screen(product: product);
          },
        },
        debugShowCheckedModeBanner: false,
        home: Splash_Scrren(),
        //home: MainScreen(),
      ),
    );
  }
}
