import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../const/colors.dart';
import '../../const/userids.dart';
import '../../data/api/api_value.dart';
import '../../feature/facebook_auth.dart';
import '../../feature/google_authentication.dart';
import '../../sharedPref/shared_pref.dart';
import '../../utils/bottom_message.dart';
import '../../utils/custom_Textfilled.dart';
import '../../utils/custom_button.dart';
import '../../utils/helper_text.dart';
import '../../utils/loadingAlertDialog.dart';
import '../../utils/social_button.dart';
import '../other_auth_screen/done_screen.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

String authToken = "";

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  SharedPreferencesHelper sharedPreferences = SharedPreferencesHelper();
  final _fromKey = GlobalKey<FormState>();
  ApiContainer apiValue = ApiContainer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   scrolledUnderElevation: 0,
      //   elevation: 0,
      // ),
      body: Form(
        key: _fromKey,
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
                    height: 80,
                  ),
                  HelperText(
                    text: "Wellcome back!",
                    isfontWeightBold: true,
                    fontsize: 28,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      HelperText(
                        text: "New here?",
                        fontsize: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SignUpScreen())));
                        },
                        child: HelperText(
                          text: "Create account",
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
                    textFilledWidth: double.infinity,
                    isRequired: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),
                    controller: emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Email Address",
                    prefix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HelperText(
                        text: '@', isfontWeightBold: true,
                        textColor: Colors.black,
                        //               ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  CustomTextField(
                    textFilledWidth: double.infinity,
                    isPass: true,

                    isRequired: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),

                    controller: passwordCtrl,
                    keyboardType: TextInputType.emailAddress,

                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Password",
                    prefix: Icon(Icons.lock_outline),
                    isSuffix: true,
                    suffix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()));
                          },
                          child: HelperText(
                            text: "Forgot?",
                            textColor: primary,
                            fontsize: 14,
                          )),
                    ),
                    //               ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CustomButton(
                        borderRadius: 30,
                        backgroundColor: primary,
                        text: "Login",
                        onPressed: () async {
                          if (_fromKey.currentState!.validate()) {
                            var res = await apiValue.login(
                                email: emailCtrl.text.trim(),
                                password: passwordCtrl.text.trim(),
                                role: role,
                                deviceToken: device_token,
                                type: type,
                                socialID: social_id);
                            print(res);
                            if (res['success'] == true) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              String token = res['token'];
                              prefs.setString('authToken', token);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DoneScreen()));
                              print(prefs.getString('authToken'));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(res['message'])));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Fill all required details")));
                          }
                        }),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: HelperText(
                      text: "or login with",
                      fontsize: 12,
                      textColor: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SignInIcons(FontAwesomeIcons.google, Colors.red,
                          () async {
                        loadingAlertDialog(context);
                        var userCredential = await signInWithGoogle();
                        log("google credentals-------- $userCredential");
                        Navigator.pop(context);

                        if (userCredential.user != null) {
                          sharedPreferences.googleAuthTrue();

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoneScreen()),
                              (route) => false);
                        } else {
                          scaffoldMessage(
                              context: context,
                              message: "Some error has occurred ");
                        }
                      }, isPng: true),
                      SignInIcons(FontAwesomeIcons.apple, Colors.black, () {}),
                      SignInIcons(FontAwesomeIcons.facebook, Colors.blue,
                          () async {
                        loadingAlertDialog(context);
                        var res = await signInFacebook();
                        Navigator.pop(context);

                        log("this is signInfacebook=> ${res}");
                        if (res != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoneScreen()),
                              (route) => false);
                        }
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  loginApiData() {
    Map<String, dynamic> loginMap = {
      "email": emailCtrl.text.trim(),
      "password": passwordCtrl.text.trim(),
      "role": role,
      "device_token": device_token,
      "type": type,
      "social_id": social_id,
    };
  }
}
