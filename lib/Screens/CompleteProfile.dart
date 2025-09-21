import 'package:best_e_commerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Completeprofile extends StatefulWidget {
  const Completeprofile({super.key});

  @override
  State<Completeprofile> createState() => _CompleteprofileState();
}

class _CompleteprofileState extends State<Completeprofile> {
  void submit() {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, Routes.otp);
    }
  }

  final _formkey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
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
                      "Complete profile",
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

              SizedBox(height: 70),

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
                              hint: Text("Enter Your First Name"),
                              label: Text("First Name"),
                              suffix: SvgPicture.asset("assets/icons/User.svg"),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter Valid Name";
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
                              hint: Text("Enter Your Last Name"),
                              label: Text("Last Name"),
                              suffix: SvgPicture.asset("assets/icons/User.svg"),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter Valid Name";
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
                              hint: Text("Enter Your Phone Number"),
                              label: Text("Phone Number"),
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
                                return 'Please enter Valid Phone Number';
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
                              hint: Text("Enter Your Address"),
                              label: Text("Address"),
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
                                return 'Please enter Valid Address';
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

              SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  "By continuing your confirm that you agree whit our terms and conditions",
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
