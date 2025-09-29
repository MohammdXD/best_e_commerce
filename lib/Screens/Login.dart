import 'package:best_e_commerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => Login_ScreenState();
}

class Login_ScreenState extends State<Login_Screen> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in with your email and password or continue with social media",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 100),

              Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 330,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Enter Your Email",
                          labelText: "Email",
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
                              !value.contains("@gmail.com")) {
                            return "Please enter a valid Email";
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
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          labelText: "Password",
                          suffixIcon: SvgPicture.asset(
                            "assets/icons/Lock.svg",
                            fit: BoxFit.scaleDown,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return "Password must be at least 6 characters long";
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
                    Text("Remember Me"),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgotPassword);
                      },
                      child: Text(
                        "Forgot Password",
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
                  onPressed: submit,
                  child: Text("Continue", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfffb7a43),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50, left: 85),
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
                padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 5),

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.register);
                      },
                      child: Text(
                        "Sign Up",
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
