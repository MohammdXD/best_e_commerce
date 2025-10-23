import 'package:best_e_commerce/Module/Proudect_API.dart';
import 'package:best_e_commerce/Provider/cart_provider.dart';
import 'package:best_e_commerce/Provider/favorit_provider.dart';
import 'package:best_e_commerce/Provider/language_provider.dart';
import 'package:best_e_commerce/Screens/CompleteProfile.dart';
import 'package:best_e_commerce/Screens/Detales_Product.dart';
import 'package:best_e_commerce/Screens/ForgotPassword.dart';
import 'package:best_e_commerce/Screens/Language_Page.dart';
import 'package:best_e_commerce/Screens/Login.dart';
import 'package:best_e_commerce/Screens/OTP.dart';
import 'package:best_e_commerce/Screens/Register.dart';
import 'package:best_e_commerce/Screens/Splash.dart';
import 'package:best_e_commerce/Screens/Main_Screen.dart';
import 'package:best_e_commerce/Screens/cart.dart';
import 'package:best_e_commerce/firebase_options.dart';
import 'package:best_e_commerce/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
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
  static String languageSettings = 'languageSettings';
  static String cart = "cart";
}

class E_commerce extends StatelessWidget {
  const E_commerce({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return SafeArea(
          child: MaterialApp(
            locale: languageProvider.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routes: {
              Routes.register: (context) => Register_Screen(),
              Routes.splash: (context) => Splash_Scrren(),
              Routes.completeProfile: (context) => Completeprofile(),
              Routes.otp: (context) => Otp(),
              Routes.login: (context) => Login_Screen(),
              Routes.forgotPassword: (context) => Forgotpassword(),
              Routes.home: (context) => MainScreen(),
              Routes.languageSettings: (context) => LanguagePage(),
              Routes.cart: (context) => CartScreen(),
              Routes.details_product: (context) {
                final product =
                    ModalRoute.of(context)!.settings.arguments as ProudectApi;
                return Detales_Screen(product: product);
              },
            },
            debugShowCheckedModeBanner: false,
            home: Splash_Scrren(),
          ),
        );
      },
    );
  }
}
