
import 'package:dio/dio.dart';

import '../dio_client/dio_client.dart';
//this is changees nowdfbghsdfg huj


class ApiContainer {

  static String baseURL = "https://sowlab.com/assignment/";
  //===============================================================URLS========================================


  static String loginUserURL = "user/login";
  static String signUpURL = "user/register";
    static String forgotPasswordURL = "user/forgot-password";
        static String verifyOTPURL = "user/verify-otp";
            static String resetPasswordURL = "user/reset-password";
             



  //==========================================APIs for User====================================================

  final DioClient _dioClinet = DioClient.instance;

 



  Future<dynamic> signUp({
 required Map data
    //  required String authorizationToken
  }) async {
  
    try {
      Response response = await _dioClinet.dio!.post(
        signUpURL,
        data: data,
     
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("status code when returning Data:${response.statusCode}");
        print("=================Sign Up response......");
        print(response);
        return response.data;
      } else {
        print("status code when returning Null:${response.statusCode}");

        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }



  Future<dynamic> login({

    //  required String authorizationToken
    required String email,
    required String password,
    required String role,
    required String deviceToken,
    required String type,
    required String socialID,
  }) async {
  var data={
    
  "email": email,
  "password": password,
  "role":role,
  "device_token": deviceToken,
  "type": type,
  "social_id": socialID

  };
    try {
      Response response = await _dioClinet.dio!.post(
        loginUserURL,
        data: data,
     
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("status code when returning Data:${response.statusCode}");
        print("=================Sign in response......");
        print(response);
        return response.data;
      } else {
        print("status code when returning Null:${response.statusCode}");

        return null;
      }
    } catch (err) {
      print(err);
      return err.toString();
    }
  }



  Future<dynamic> forgotPassword({

    required String phone,
   
  }) async {
  var data={
    
  "mobile": phone,
 

  };
    try {
      Response response = await _dioClinet.dio!.post(
        forgotPasswordURL,
        data: data,
     
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("status code when returning Data:${response.statusCode}");
        print("=================FORGOT PASS  response......");
        print(response);
        return response.data;
      } else {
        print("status code when returning Null:${response.statusCode}");

        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<dynamic> resetPassword({

required String token,
required String passsword,
required String cpassword,
   
  }) async {
  var data={

    
  "token": token,
  "password": passsword,
  "cpassword": cpassword


 

  };
    try {
      Response response = await _dioClinet.dio!.post(
        resetPasswordURL,
        data: data,
     
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("status code when returning Data:${response.statusCode}");
        print("=================reset PASS  response......");
        print(response);
        return response.data;
      } else {
        print("status code when returning Null:${response.statusCode}");

        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }


}



