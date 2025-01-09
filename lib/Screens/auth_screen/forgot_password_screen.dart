import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../data/api/api_value.dart';
import '../../utils/custom_Textfilled.dart';
import '../../utils/custom_button.dart';
import '../../utils/helper_text.dart';
import 'sign_in_screen.dart';
import 'verify_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ApiContainer apiContainer = ApiContainer();
  TextEditingController forgotPassCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
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
                    height: 50,
                  ),
                  HelperText(
                    text: "Forgot Password",
                    isfontWeightBold: true,
                    fontsize: 21,
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
                          Navigator.pop(
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
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),
                    controller: forgotPassCtrl,
                    keyboardType: TextInputType.number,
                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Phone Number",

                    prefix: Icon(Icons.call),
                    //               ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //               ),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CustomButton(
                        borderRadius: 30,
                        backgroundColor: primary,
                        text: "Send code",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var res = await apiContainer.forgotPassword(
                                phone: "+91${forgotPassCtrl.text.trim()}");

                            if (res['success'] == true) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VerifyOtpScreen()));
                            }
                            if (res['message'] ==
                                "Couldn't send an OTP, please try again.") {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VerifyOtpScreen()));
                            } else {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => VerifyOtpScreen()));

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(res['message'])));
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
