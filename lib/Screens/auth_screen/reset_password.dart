import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/colors.dart';
import '../../data/api/api_value.dart';
import '../../utils/bottom_message.dart';
import '../../utils/custom_Textfilled.dart';
import '../../utils/custom_button.dart';
import '../../utils/helper_text.dart';
import 'sign_in_screen.dart';

class ResetPassowordScreen extends StatefulWidget {
  const ResetPassowordScreen({super.key});

  @override
  State<ResetPassowordScreen> createState() => _ResetPassowordScreenState();
}

class _ResetPassowordScreenState extends State<ResetPassowordScreen> {
  TextEditingController newPassCtrl = TextEditingController();
  TextEditingController confirmNewPassCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  ApiContainer apiContainer = ApiContainer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  HelperText(
                    text: "Reset Password",
                    isfontWeightBold: true,
                    fontsize: 25,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      HelperText(
                        text: "Remember your password?",
                        fontsize: 12,
                        textColor: Colors.grey.shade500,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                        child: HelperText(
                          text: "Login",
                          fontsize: 15,
                          textColor: primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomTextField(
                    isPass: true,
                    isRequired: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),
                    controller: newPassCtrl,
                    keyboardType: TextInputType.visiblePassword,
                    isborderSide: false,
                    isPrefix: true,
                    hintText: "New Password",

                    prefix: Icon(Icons.lock_outline),
                    //               ),
                  ),

                  CustomTextField(
                    isRequired: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),
                    controller: confirmNewPassCtrl,
                    keyboardType: TextInputType.visiblePassword,
                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Confirm New Password",

                    prefix: Icon(Icons.lock_outline),
                    //               ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  //               ),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CustomButton(
                        borderRadius: 30,
                        backgroundColor: primary,
                        text: "Submit",
                        onPressed: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          String data = pref.getString("authToken").toString();

                          log("This is AuthToken $data");

                          if (_formkey.currentState!.validate()) {
                            if (newPassCtrl.text.trim() ==
                                    confirmNewPassCtrl.text.trim() &&
                                newPassCtrl.text.isNotEmpty) {
                              var res = await apiContainer.resetPassword(
                                  token: data,
                                  passsword: newPassCtrl.text.trim(),
                                  cpassword: confirmNewPassCtrl.text.trim());
                              if (res['success'] == true) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()),
                                  (Route<dynamic> route) => false,
                                );
                              } else if (res['message'] == "Invalid token.") {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()),
                                  (Route<dynamic> route) => false,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(res['message'])));
                              }
                            } else {
                              scaffoldMessage(
                                  context: context,
                                  message: "Password don't match");
                            }
                          }
                        }),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
