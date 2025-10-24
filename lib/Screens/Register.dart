import 'package:best_e_commerce/generated/l10n.dart';
import 'package:best_e_commerce/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Register_Screen extends StatelessWidget {
  Register_Screen({super.key});

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

  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conpasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Future<void> _signUp() async {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Navigator.pushNamed(
          context,
          Routes.completeProfile,
          arguments: {
            'email': emailController.text.trim(),
            'password': passwordController.text.trim(),
            'confirmPassword': conpasswordController.text.trim(),
          },
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Data added successfully to Firestore!")),
        );
        emailController.clear();
        passwordController.clear();
        conpasswordController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error adding data to Firestore: $e")),
        );
      }
    }

    // Future<void> _creat() async {
    //   try {
    //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       email: emailController.text.trim(),
    //       password: passwordController.text.trim(),
    //     );
    //     Navigator.pushNamed(context, Routes.completeProfile);
    //     emailController.clear();
    //     passwordController.clear();
    //     conpasswordController.clear();
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'weak-password') {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text("The password provided is too weak.")),
    //       );
    //     } else if (e.code == 'email-already-in-use') {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: Text("The account already exists for that email."),
    //         ),
    //       );
    //     }
    //   }
    // }

    void submit() {
      if (_formkey.currentState!.validate()) {}
    }

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
                      S.of(context).registerAccount,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).completeYourDetails,
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
                          hint: Text(S.of(context).enterYourEmail),
                          label: Text(S.of(context).email),
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
                          if (value == null ||
                              !value.toLowerCase().contains("@gmail.com")) {
                            return S.of(context).validEmail;
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
                          hint: Text(S.of(context).enterYourPassword),
                          label: Text(S.of(context).password),
                          suffix: SvgPicture.asset("assets/icons/Lock.svg"),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return S.of(context).passwordValidation;
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
                          hint: Text(S.of(context).reEnterPassword),
                          label: Text(S.of(context).confirmedPassword),
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
                            return S.of(context).passwordNotMatch;
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
                  onPressed: _signUp,
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

              SizedBox(height: 30),

              Text(S.of(context).agreeTerms),
            ],
          ),
        ),
      ),
    );
  }
}
