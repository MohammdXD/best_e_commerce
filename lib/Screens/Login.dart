import 'package:best_e_commerce/Provider/language_provider.dart';
import 'package:best_e_commerce/generated/l10n.dart';
import 'package:best_e_commerce/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => Login_ScreenState();
}

class Login_ScreenState extends State<Login_Screen> {
  bool _obscurePassword = true;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushNamed(context, Routes.home);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("wrong email or password")));
    }
  }

  bool _isChecked = false;
  late SharedPreferences _prefs;

  final Uri googleUri = Uri.parse('https://flutter.dev');
  final Uri facebookUri = Uri.parse('https://flutter.dev');
  final Uri twitterUri = Uri.parse('https://flutter.dev');

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isChecked = _prefs.getBool('rememberMe') ?? false;
      if (_isChecked) {
        emailController.text = _prefs.getString('savedEmail') ?? '';
      }
    });
  }

  Future<void> _saveEmail() async {
    if (_isChecked && emailController.text.isNotEmpty) {
      await _prefs.setString('savedEmail', emailController.text);
    }
  }

  Future<void> _clearEmail() async {
    await _prefs.remove('savedEmail');
  }

  Future<void> _toggleRememberMe(bool? value) async {
    setState(() {
      _isChecked = value ?? false;
    });

    await _prefs.setBool('rememberMe', _isChecked);

    if (_isChecked) {
      await _saveEmail();
    } else {
      await _clearEmail();
    }
  }

  Future<void> _googleUri() async {
    if (!await launchUrl(googleUri)) {
      throw Exception('Could not launch $googleUri');
    }
  }

  Future<void> _facebookUri() async {
    if (!await launchUrl(facebookUri)) {
      throw Exception('Could not launch $facebookUri');
    }
  }

  Future<void> _twitterUri() async {
    if (!await launchUrl(twitterUri)) {
      throw Exception('Could not launch $twitterUri');
    }
  }

  void submit() {
    if (_formkey.currentState!.validate()) {
      if (_isChecked) {
        _saveEmail();
      }
      Navigator.pushNamed(context, Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isArabic = languageProvider.isArabic;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading: BackButton(), backgroundColor: Colors.white),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      S.of(context).welcomeBack,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).signInDescription,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 80),

              Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 330,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: S.of(context).enterYourEmail,
                          labelText: S.of(context).email,
                          suffixIcon: SvgPicture.asset(
                            "assets/icons/Mail.svg",
                            height: 15,
                            fit: BoxFit.scaleDown,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.toLowerCase().contains("@gmail.com")) {
                            return S.of(context).validEmail;
                          }
                          return null;
                        },
                      ),
                    ),

                    SizedBox(height: 30),

                    SizedBox(
                      width: 330,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: S.of(context).enterYourPassword,
                          labelText: S.of(context).password,
                          suffixIcon: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.grey[500],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                                SizedBox(width: 4),
                                SvgPicture.asset(
                                  "assets/icons/Lock.svg", // Example: visibility icon
                                  fit: BoxFit.scaleDown,
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 7),
                              ],
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return S.of(context).passwordValidation;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 70),

              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xfffb7a43),
                      value: _isChecked,
                      onChanged: _toggleRememberMe,
                    ),
                    Text(S.of(context).rememberMe),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgotPassword);
                      },
                      child: Text(
                        S.of(context).forgotPassword,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 330,
                child: ElevatedButton(
                  onPressed: _login,
                  child: Text(
                    S.of(context).Continue,
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfffb7a43),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: _googleUri,
                      style: TextButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Color(0xfff5f6f9),
                      ),
                      child: SvgPicture.asset("assets/icons/google-icon.svg"),
                    ),

                    SizedBox(width: 10),

                    TextButton(
                      onPressed: _facebookUri,
                      style: TextButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Color(0xfff5f6f9),
                      ),
                      child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                    ),

                    SizedBox(width: 10),

                    TextButton(
                      onPressed: _twitterUri,
                      style: TextButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Color(0xfff5f6f9),
                      ),
                      child: SvgPicture.asset("assets/icons/twitter.svg"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              Padding(
                padding: isArabic
                    ? EdgeInsets.symmetric(horizontal: 100)
                    : EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  children: [
                    Text(
                      S.of(context).dontHaveAccount,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 5),

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.register);
                      },
                      child: Text(
                        S.of(context).signUp,
                        style: TextStyle(
                          color: Color(0xfffb7a43),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
