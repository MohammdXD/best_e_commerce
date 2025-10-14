import 'package:best_e_commerce/Provider/language_provider.dart';
import 'package:best_e_commerce/generated/l10n.dart';
import 'package:best_e_commerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Forgotpassword extends StatelessWidget {
  Forgotpassword({super.key});

  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void submit() {
      if (_formkey.currentState!.validate()) {
        Navigator.pushNamed(context, Routes.register);
      }
    }

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
                      S.of(context).forgotPassword,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  S.of(context).forgotPasswordDescription,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 200),

              Form(
                key: _formkey,
                child: SizedBox(
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
              ),

              SizedBox(height: 200),
              SizedBox(
                height: 50,
                width: 330,

                child: ElevatedButton(
                  onPressed: submit,
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

              Padding(
                padding: isArabic
                    ? EdgeInsets.symmetric(horizontal: 100, vertical: 80)
                    : EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                child: Row(
                  children: [
                    Text(
                      S.of(context).dontHaveAccount,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 5),

                    InkWell(
                      child: Text(
                        S.of(context).signUp,
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
