import 'package:best_e_commerce/generated/l10n.dart';
import 'package:best_e_commerce/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Completeprofile extends StatelessWidget {
  Completeprofile({super.key});

  final _formkey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final email = args['email'];
    final password = args['password'];
    final confirmPassword = args['confirmPassword'];

    Future<void> _createUser() async {
      try {
        final userData = {
          'firstName': firstNameController.text.trim(),
          'lastName': lastNameController.text.trim(),
          'phoneNumber': phoneNumberController.text.trim(),
          'address': addressController.text.trim(),
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'createdOn': DateTime.now(),
        };

        await _firestore
            .collection('usersData')
            .doc(_auth.currentUser!.uid)
            .set(userData);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data added successfully!')),
        );

        firstNameController.clear();
        lastNameController.clear();
        phoneNumberController.clear();
        addressController.clear();

        Navigator.pushNamed(context, Routes.otp);
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error adding data: $e')));
      }
    }

    void submit() {
      if (_formkey.currentState!.validate()) {
        Navigator.pushNamed(context, Routes.otp);
      }
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
                      S.of(context).completeProfile,
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

              SizedBox(height: 50),

              Column(
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 330,
                          child: TextFormField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                              hint: Text(S.of(context).enterYourFirstName),
                              label: Text(S.of(context).firstName),
                              suffix: SvgPicture.asset("assets/icons/User.svg"),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).pleaseEnterValidName;
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
                            controller: lastNameController,
                            decoration: InputDecoration(
                              hint: Text(S.of(context).enterYourLastName),
                              label: Text(S.of(context).lastName),
                              suffix: SvgPicture.asset("assets/icons/User.svg"),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).pleaseEnterValidName;
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
                            controller: phoneNumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hint: Text(S.of(context).enterYourPhoneNumber),
                              label: Text(S.of(context).phoneNumber),
                              suffix: SvgPicture.asset(
                                "assets/icons/Phone.svg",
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),

                            validator: (value) {
                              if (value == null ||
                                  (value.length < 10 &&
                                      !value.contains("07"))) {
                                return S
                                    .of(context)
                                    .pleaseEnterValidPhoneNumber;
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 30),

                        SizedBox(
                          width: 330,
                          child: TextFormField(
                            controller: addressController,
                            decoration: InputDecoration(
                              hint: Text(S.of(context).enterYourAddress),
                              label: Text(S.of(context).address),
                              suffix: SvgPicture.asset(
                                "assets/icons/Location point.svg",
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).pleaseEnterValidAddress;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: 330,

                child: ElevatedButton(
                  onPressed: _createUser,
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

              SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  S.of(context).agreeTerms,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
