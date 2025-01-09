import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_softlab/const/colors.dart';
import 'package:new_softlab/utils/helper_text.dart';

import '../Screens/auth_screen/sign_in_screen.dart';
import '../sharedPref/shared_pref.dart';

SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
alertDialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: primary,
        title: HelperText(
          text: "Exit",
          textColor: whiteText,
        ),
        content: HelperText(
          text: "Are you sure that you want to Exit",
          textColor: whiteText,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: HelperText(
              text: "Cancel",
              fontsize: 15,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await GoogleSignIn().signOut();
              FirebaseAuth.instance.signOut();
              FacebookAuth.instance.logOut();
              sharedPreferencesHelper.googleAuthFalse();

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                  (route) => false);
              // Navigator.pop(context);
            },
            child: HelperText(
              text: "Okk",
              fontsize: 15,
            ),
          )
        ],
      );
    },
  );
}
