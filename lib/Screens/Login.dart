import 'package:best_e_commerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:url_launcher/url_launcher.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => Login_ScreenState();
}

class Login_ScreenState extends State<Login_Screen> {
  final Uri googleUri = Uri.parse('https://flutter.dev');
  final Uri facebookUri = Uri.parse('https://flutter.dev');
  final Uri twitterUri = Uri.parse('https://flutter.dev');

  Future<void> _googleUri(Uri url) async {
    if (!await launchUrl(googleUri)) {
      throw Exception('Could not launch $googleUri');
    }
  }

  Future<void> _facebookUri(Uri url) async {
    if (!await launchUrl(facebookUri)) {
      throw Exception('Could not launch $facebookUri');
    }
  }

  Future<void> _twitterUri(Uri url) async {
    if (!await launchUrl(twitterUri)) {
      throw Exception('Could not launch $twitterUri');
    }
  }

  void submit() {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, Routes.register);
    }
  }

  bool isChecked = false;

  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton()),

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
                      "Sgin in with your email and password or continue with social media",
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
                          hint: Text("Enter Your Email"),
                          label: Text("Email"),
                          suffix: SvgPicture.asset(
                            "assets/icons/Mail.svg",
                            height: 15,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || !value.contains("@gmail.com")) {
                            return "Please enter Valid Email";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 30),

                    SizedBox(
                      width: 330,
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hint: Text("Enter Your Password"),
                          label: Text("Password"),
                          suffix: SvgPicture.asset("assets/icons/Lock.svg"),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return "Password must be at least 6 characters long";
                          } else {
                            return null;
                          }
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
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text("Remember Me"),
                    Spacer(),
                    InkWell(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgotPassword);
                      },
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
                      onPressed: () {
                        _googleUri(googleUri);
                      },
                      style: TextButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Color(0xfff5f6f9),
                      ),
                      child: SvgPicture.asset("assets/icons/google-icon.svg"),
                    ),

                    SizedBox(width: 10),

                    TextButton(
                      onPressed: () {
                        _facebookUri(facebookUri);
                      },
                      style: TextButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Color(0xfff5f6f9),
                      ),
                      child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                    ),

                    SizedBox(width: 10),

                    TextButton(
                      onPressed: () {
                        _twitterUri(twitterUri);
                      },
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
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xfffb7a43),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.register);
                      },
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
}
