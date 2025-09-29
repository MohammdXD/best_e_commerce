import 'package:best_e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _RegisterSscreenState();
}

class _RegisterSscreenState extends State<Register_Screen> {
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
      Navigator.pushNamed(context, Routes.completeProfile);
    }
  }

  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conpasswordController = TextEditingController();
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
                      "Register Account",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Complete your details or continue with social media",
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

                    SizedBox(height: 30),

                    SizedBox(
                      width: 330,
                      child: TextFormField(
                        controller: conpasswordController,
                        decoration: InputDecoration(
                          hint: Text("Re-enter Your Password"),
                          label: Text("Confirmed Password"),
                          suffix: SvgPicture.asset("assets/icons/Lock.svg"),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              value != passwordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 70),
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

              Text("By continuing your confirm that you agree"),
            ],
          ),
        ),
      ),
    );
  }
}
