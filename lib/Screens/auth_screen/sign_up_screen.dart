import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../const/colors.dart';
import '../../const/userids.dart';

import '../../feature/facebook_auth.dart';
import '../../feature/google_authentication.dart';
import '../../sharedPref/shared_pref.dart';
import '../../utils/bottom_message.dart';
import '../../utils/custom_Textfilled.dart';
import '../../utils/custom_button.dart';
import '../../utils/helper_text.dart';
import '../../utils/loadingAlertDialog.dart';
import '../../utils/social_button.dart';
import '../other_auth_screen/frame_info.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController conPassCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();

  SharedPreferencesHelper sharedPreferences = SharedPreferencesHelper();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false ,
      //   scrolledUnderElevation: 0,
      //   elevation: 0,
      // ),
      body: Form(
        key: _formKey,
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
                    text: "Wellcome!",
                    isfontWeightBold: true,
                    fontsize: 28,
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
                        Navigator.pop(context);
                        if (userCredential.user != null) {
                          addAllDataInMapUsingGoogleAuth(userCredential);
                          // sharedPreferences.googleAuthTrue();
                          log("I am google authentication");
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FarmInfo()),
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
                        Map<String, dynamic>? res = await signInFacebook();
                        Navigator.pop(context);
                        // print("this is signInfacebook=> ${res}");
                        // print("this is signInfacebook=> ${res['email']}");

                        if (res != null) {
                          addAllDataInMapUsingFacebookAuth(res);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FarmInfo()),
                              (route) => false);
                        }
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: HelperText(
                      text: "or signup with",
                      fontsize: 12,
                      textColor: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    textFilledWidth: double.infinity,

                    isRequired: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),
                    controller: nameCtrl,
                    keyboardType: TextInputType.name,
                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Full Name",
                    prefix: Icon(Icons.person_2_outlined),

                    // prefix: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: HelperText(
                    //     text: '@', isfontWeightBold: true, textColor: Colors.black,
                    //     //               ),
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    height: 5,
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
                        text: '@',
                        textColor: Colors.black,
                        //               ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    textFilledWidth: double.infinity,
                    isRequired: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),
                    controller: numberCtrl,
                    keyboardType: TextInputType.number,
                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Phone Number",
                    prefix: Icon(Icons.call),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    textFilledWidth: double.infinity,
                    isRequired: true,
                    isPass: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),

                    controller: passCtrl,
                    keyboardType: TextInputType.emailAddress,

                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Password",

                    prefix: Icon(Icons.lock_outline),

                    //               ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    textFilledWidth: double.infinity,
                    isRequired: true,

                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),

                    controller: conPassCtrl,
                    keyboardType: TextInputType.visiblePassword,

                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Re-enter Password",

                    prefix: Icon(Icons.lock_outline),

                    //               ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          },
                          child: HelperText(
                            text: "Login",
                            isUnderline: true,
                            fontsize: 15,
                          )),
                      SizedBox(
                        width: 220,
                        height: 50,
                        child: CustomButton(
                            borderRadius: 30,
                            backgroundColor: primary,
                            text: "Continue",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (passCtrl.text.trim() ==
                                    conPassCtrl.text.trim()) {
                                  addAllDataInMap();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => FarmInfo())));
                                } else {
                                  scaffoldMessage(
                                      context: context,
                                      message: "Password don't match");
                                }
                              }
                            }),
                      ),
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

  addAllDataInMap() {
    signUpMap = {
      "full_name": nameCtrl.text.trim(),
      "email": emailCtrl.text.trim(),
      "phone": "+91${numberCtrl.text.trim()}",
      "password": passCtrl.text.trim(),
      "role": role,
    };
  }

  addAllDataInMapUsingGoogleAuth(UserCredential credential) {
    User? user = credential.user;
    String? googleId;
    if (user != null) {
      for (var userInfo in user.providerData) {
        if (userInfo.providerId == 'google.com') {
          googleId = userInfo.uid; // This is the Google ID (social ID)
        }
      }
    }
    log("Google ID (Social ID): $googleId");
    signUpMap = {
      "full_name": credential.user!.displayName,
      "email": credential.user!.email,
      "phone": credential.user?.phoneNumber,
      "password": "",
      "role": role,

      "device_token": googleId,
      "type": 'google',
      "social_id": googleId,

//       var device_token = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
// var type = "email/facebook/google/apple";
// var social_id = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
    };
  }

  addAllDataInMapUsingFacebookAuth(data) {
    signUpMap = {
      "full_name": data['name'],
      "email": data['email'],
      "phone": '',
      "password": "",
      "role": role,
      "device_token": data['id'],
      "type": 'facebook',
      "social_id": data['id'],
    };
  }
}

Map<String, dynamic> signUpMap = {};
