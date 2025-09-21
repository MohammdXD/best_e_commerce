import 'package:best_e_commerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  void submit() {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, Routes.register);
    }
  }

  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
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
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Please enter your email and we will send \n you a link to return to you account",
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 200),

              Form(
                key: _formkey,
                child: SizedBox(
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
              ),

              SizedBox(height: 200),
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
                padding: EdgeInsets.fromLTRB(85, 50, 0, 0),
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
