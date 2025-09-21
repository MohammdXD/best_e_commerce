import 'package:best_e_commerce/Screens/Register.dart';
import 'package:best_e_commerce/Screens/Splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(E_commerce());
}

class Routes {
  static const String register = 'register';
  static const String splash = 'splash';
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
        },
        debugShowCheckedModeBanner: false,
        home: Splash_Scrren(),
      ),
    );
  }
}
