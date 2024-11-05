// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:testapi/model.dart';

// signInFacebook()async{
//   var userData;
//   final LoginResult loginResult=await FacebookAuth.instance.login(permissions: ['email']);
//    final OAuthCredential oAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
//   if(loginResult==LoginStatus.success){
//      userData=await FacebookAuth.instance.getUserData(fields: "email,name");
//      log("this is user email ${userData["email"]}");
//   }
//   else{
//         log("Some error occurred in facebook feature");
//   }
//   // final OAuthCredential oAuthCredential=FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
//   FirebaseAuth.instance.signInWithCredential(oAuthCredential);
//   return  userData;
// }

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<Map<String, dynamic>?> signInFacebook() async {
  // Initiate Facebook login
  final LoginResult loginResult =
      await FacebookAuth.instance.login(permissions: ['email']);

  if (loginResult.status == LoginStatus.success) {
    try {
      final AccessToken accessToken = loginResult.accessToken!;

      final OAuthCredential oAuthCredential =
          FacebookAuthProvider.credential(accessToken.tokenString);

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(oAuthCredential);

      final userData =
          await FacebookAuth.instance.getUserData(fields: "email,name");

      final String? email = userData['email'];
      final String? name = userData['name'];

      // log("User Name: $name");
      // log("User Email: $email");
      // var data = {'name': "Deep"};

      return userData;
    } catch (e) {
      log("Error during sign in or retrieving user data: $e");
      return null;
    }
  } else {
    log("Facebook login failed with status: ${loginResult.status}");
    return null;
  }
}
