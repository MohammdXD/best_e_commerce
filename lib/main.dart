import 'package:best_e_commerce/Screens/CompleteProfile.dart';
import 'package:best_e_commerce/Screens/ForgotPassword.dart';
import 'package:best_e_commerce/Screens/Login.dart';
import 'package:best_e_commerce/Screens/OTP.dart';
import 'package:best_e_commerce/Screens/Register.dart';
import 'package:best_e_commerce/Screens/Splash.dart';
import 'package:best_e_commerce/Screens/Main_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(E_commerce());
}

class Routes {
  static const String register = 'register';
  static const String splash = 'splash';
  static const String completeProfile = 'completeprofile';
  static const String otp = 'otp';
  static const String login = 'login';
  static const String forgotPassword = 'forgotPassword';
  static const String home = 'home';
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
        },
        debugShowCheckedModeBanner: false,
        //home: Splash_Scrren(),
        home: MainScreen(),
      ),
    );
  }
}
