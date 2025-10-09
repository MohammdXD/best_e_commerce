// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `A Summer Surprise`
  String get aSummerSurprise {
    return Intl.message(
      'A Summer Surprise',
      name: 'aSummerSurprise',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Added to Cart`
  String get addedToCart {
    return Intl.message(
      'Added to Cart',
      name: 'addedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `By continuing your confirm that you agree`
  String get agreeTerms {
    return Intl.message(
      'By continuing your confirm that you agree',
      name: 'agreeTerms',
      desc: '',
      args: [],
    );
  }

  /// `Bill`
  String get bill {
    return Intl.message('Bill', name: 'bill', desc: '', args: []);
  }

  /// `Brands 18`
  String get brands1 {
    return Intl.message('Brands 18', name: 'brands1', desc: '', args: []);
  }

  /// `Brands 24`
  String get brands2 {
    return Intl.message('Brands 24', name: 'brands2', desc: '', args: []);
  }

  /// `Cashback 20%`
  String get cashback20 {
    return Intl.message('Cashback 20%', name: 'cashback20', desc: '', args: []);
  }

  /// `Your cart is empty`
  String get cartIsEmpty {
    return Intl.message(
      'Your cart is empty',
      name: 'cartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Checkout feature coming soon!`
  String get checkoutComingSoon {
    return Intl.message(
      'Checkout feature coming soon!',
      name: 'checkoutComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Clear Cart`
  String get clearCart {
    return Intl.message('Clear Cart', name: 'clearCart', desc: '', args: []);
  }

  /// `Are you sure you want to clear your cart?`
  String get clearCartConfirmation {
    return Intl.message(
      'Are you sure you want to clear your cart?',
      name: 'clearCartConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `cancel`
  String get cancel {
    return Intl.message('cancel', name: 'cancel', desc: '', args: []);
  }

  /// `This code will expire in `
  String get codeExpire {
    return Intl.message(
      'This code will expire in ',
      name: 'codeExpire',
      desc: '',
      args: [],
    );
  }

  /// `Complete profile`
  String get completeProfile {
    return Intl.message(
      'Complete profile',
      name: 'completeProfile',
      desc: '',
      args: [],
    );
  }

  /// `Complete your details or continue with social media`
  String get completeYourDetails {
    return Intl.message(
      'Complete your details or continue with social media',
      name: 'completeYourDetails',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed Password`
  String get confirmedPassword {
    return Intl.message(
      'Confirmed Password',
      name: 'confirmedPassword',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message('Continue', name: 'Continue', desc: '', args: []);
  }

  /// `Daily`
  String get daily {
    return Intl.message('Daily', name: 'daily', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter Your Address`
  String get enterYourAddress {
    return Intl.message(
      'Enter Your Address',
      name: 'enterYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get enterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your First Name`
  String get enterYourFirstName {
    return Intl.message(
      'Enter Your First Name',
      name: 'enterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Last Name`
  String get enterYourLastName {
    return Intl.message(
      'Enter Your Last Name',
      name: 'enterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone Number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter Your Phone Number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Fashion`
  String get fashion {
    return Intl.message('Fashion', name: 'fashion', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Tap the heart icon to add products to favorites`
  String get favoritesInstruction {
    return Intl.message(
      'Tap the heart icon to add products to favorites',
      name: 'favoritesInstruction',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Flash`
  String get flash {
    return Intl.message('Flash', name: 'flash', desc: '', args: []);
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email and we will send you a link to return to you account`
  String get forgotPasswordDescription {
    return Intl.message(
      'Please enter your email and we will send you a link to return to you account',
      name: 'forgotPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Games`
  String get games {
    return Intl.message('Games', name: 'games', desc: '', args: []);
  }

  /// `Help & Support`
  String get helpSupport {
    return Intl.message(
      'Help & Support',
      name: 'helpSupport',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Language Settings`
  String get languageSettings {
    return Intl.message(
      'Language Settings',
      name: 'languageSettings',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `My profile`
  String get myProfile {
    return Intl.message('My profile', name: 'myProfile', desc: '', args: []);
  }

  /// `No chat yet`
  String get noChatYet {
    return Intl.message('No chat yet', name: 'noChatYet', desc: '', args: []);
  }

  /// `No favorites yet`
  String get noFavoritesYet {
    return Intl.message(
      'No favorites yet',
      name: 'noFavoritesYet',
      desc: '',
      args: [],
    );
  }

  /// `Notification Settings`
  String get notificationSettings {
    return Intl.message(
      'Notification Settings',
      name: 'notificationSettings',
      desc: '',
      args: [],
    );
  }

  /// `We sent your code to +1 898 860 ***`
  String get otpSentMessage {
    return Intl.message(
      'We sent your code to +1 898 860 ***',
      name: 'otpSentMessage',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otpVerification {
    return Intl.message(
      'OTP Verification',
      name: 'otpVerification',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Password does not match`
  String get passwordNotMatch {
    return Intl.message(
      'Password does not match',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get passwordValidation {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Valid Address`
  String get pleaseEnterValidAddress {
    return Intl.message(
      'Please enter Valid Address',
      name: 'pleaseEnterValidAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Valid Email`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter Valid Email',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Valid Name`
  String get pleaseEnterValidName {
    return Intl.message(
      'Please enter Valid Name',
      name: 'pleaseEnterValidName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Valid Phone Number`
  String get pleaseEnterValidPhoneNumber {
    return Intl.message(
      'Please enter Valid Phone Number',
      name: 'pleaseEnterValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Popular Products`
  String get popularProducts {
    return Intl.message(
      'Popular Products',
      name: 'popularProducts',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get productDescription {
    return Intl.message(
      'Product Description',
      name: 'productDescription',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter Your Password`
  String get reEnterPassword {
    return Intl.message(
      'Re-enter Your Password',
      name: 'reEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register Account`
  String get registerAccount {
    return Intl.message(
      'Register Account',
      name: 'registerAccount',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message('Remember Me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Resend OTP Code`
  String get resendOtpCode {
    return Intl.message(
      'Resend OTP Code',
      name: 'resendOtpCode',
      desc: '',
      args: [],
    );
  }

  /// `Search products`
  String get searchProducts {
    return Intl.message(
      'Search products',
      name: 'searchProducts',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get security {
    return Intl.message('Security', name: 'security', desc: '', args: []);
  }

  /// `See More`
  String get seeMore {
    return Intl.message('See More', name: 'seeMore', desc: '', args: []);
  }

  /// `See More Detail`
  String get seeMoreDetail {
    return Intl.message(
      'See More Detail',
      name: 'seeMoreDetail',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Shopping Cart`
  String get shoppingCart {
    return Intl.message(
      'Shopping Cart',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with your email and password or continue with social media`
  String get signInDescription {
    return Intl.message(
      'Sign in with your email and password or continue with social media',
      name: 'signInDescription',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Smartphone`
  String get smartphone {
    return Intl.message('Smartphone', name: 'smartphone', desc: '', args: []);
  }

  /// `Special for you`
  String get specialForYou {
    return Intl.message(
      'Special for you',
      name: 'specialForYou',
      desc: '',
      args: [],
    );
  }

  /// `TOKOTO`
  String get splashTitle {
    return Intl.message('TOKOTO', name: 'splashTitle', desc: '', args: []);
  }

  /// `By continuing your confirm that you agree with our terms and conditions`
  String get termsAndConditions {
    return Intl.message(
      'By continuing your confirm that you agree with our terms and conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Please enter valid email`
  String get validEmail {
    return Intl.message(
      'Please enter valid email',
      name: 'validEmail',
      desc: '',
      args: [],
    );
  }

  /// `View Cart`
  String get viewCart {
    return Intl.message('View Cart', name: 'viewCart', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Tokoto, Let's shop!`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to Tokoto, Let\'s shop!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
