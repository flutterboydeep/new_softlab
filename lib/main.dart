import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/auth_screen/sign_in_screen.dart';
import 'Screens/on_boarding_screens/main_on_boarding_screen.dart';
import 'const/colors.dart';
import 'sharedPref/shared_pref.dart';

late SharedPreferences _sharedPreferences;
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // await Firebase.initializeApp(
    // options: FirebaseOptions(
    //     apiKey: "AIzaSyArpR9TJeuCYunr6zPddA1rLIVwt1iVap0",
    //     appId: "1:428387108052:web:20609b5a3f4e63ad3ba741",
    //     messagingSenderId: "428387108052",
    //     projectId: "chat-5673b",
    //     storageBucket: "chat-5673b.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  await SharedPreferencesHelper.init();

  await _initializePrefs();

  runApp(const MyApp());
}

Future<void> _initializePrefs() async {
  _sharedPreferences = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            primary: primary,
            secondary: secondary,
            tertiary: tertiary,
            seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:   const MainOnBoardingScreen(),
      home: SharedPreferencesHelper.getFirstTime() == true ||
              SharedPreferencesHelper.getFirstTime() == null
          ? MainOnBoardingScreen()
          : SignInScreen(),
    );
  }
}
