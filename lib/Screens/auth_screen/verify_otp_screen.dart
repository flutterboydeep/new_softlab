import 'package:flutter/material.dart';

import '../../const/colors.dart';

import '../../utils/bottom_message.dart';
import '../../utils/custom_Textfilled.dart';
import '../../utils/custom_button.dart';
import '../../utils/helper_text.dart';
import 'reset_password.dart';
import 'sign_in_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  // @override
  // void dispose() {
  //   super.dispose();
  //   otp1.dispose();
  //   otp2.dispose();
  //   otp3.dispose();
  //   otp4.dispose();
  //   otp5.dispose();
  //   otp6.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                HelperText(
                  text: "Verify OTP",
                  isfontWeightBold: true,
                  fontsize: 28,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                        isOnChange: true,
                        contectPadding: EdgeInsets.all(0),
                        cursorHeight: 40,
                        textAlign: TextAlign.center,
                        maxValueofCharacter: 1,
                        onChange: (value) {
                          if (otp1.text.characters.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          } else {}
                        },
                        isPrefix: false,
                        textStyle: TextStyle(color: primary, fontSize: 28),
                        textFilledHeight: 50,
                        textFilledWidth: 40,
                        isborderSide: false,
                        controller: otp1,
                        keyboardType: TextInputType.number),
                    CustomTextField(
                        isOnChange: true,
                        contectPadding: EdgeInsets.all(0),
                        cursorHeight: 40,
                        textAlign: TextAlign.center,
                        maxValueofCharacter: 1,
                        onChange: (value) {
                          if (otp2.text.characters.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          } else {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        textStyle: TextStyle(color: primary, fontSize: 28),
                        textFilledHeight: 50,
                        textFilledWidth: 40,
                        isborderSide: false,
                        controller: otp2,
                        keyboardType: TextInputType.number),
                    CustomTextField(
                        isOnChange: true,
                        contectPadding: EdgeInsets.all(0),
                        cursorHeight: 40,
                        textAlign: TextAlign.center,
                        maxValueofCharacter: 1,
                        onChange: (value) {
                          if (otp3.text.characters.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          } else {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        textStyle: TextStyle(color: primary, fontSize: 28),
                        textFilledHeight: 50,
                        textFilledWidth: 40,
                        isborderSide: false,
                        controller: otp3,
                        keyboardType: TextInputType.number),
                    CustomTextField(
                        isOnChange: true,
                        contectPadding: EdgeInsets.all(0),
                        cursorHeight: 40,
                        textAlign: TextAlign.center,
                        maxValueofCharacter: 2,
                        onChange: (value) {
                          if (otp4.text.characters.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          } else {
                            FocusScope.of(context).previousFocus();
                            // FocusScope.of(context).nextFocus();
                          }
                        },
                        textStyle: TextStyle(color: primary, fontSize: 28),
                        textFilledHeight: 50,
                        textFilledWidth: 40,
                        isborderSide: false,
                        controller: otp4,
                        keyboardType: TextInputType.number),
                    CustomTextField(
                        isOnChange: true,
                        contectPadding: EdgeInsets.all(0),
                        cursorHeight: 40,
                        textAlign: TextAlign.center,
                        maxValueofCharacter: 1,
                        onChange: (value) {
                          if (otp5.text.characters.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          } else {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        textStyle: TextStyle(color: primary, fontSize: 28),
                        textFilledHeight: 50,
                        textFilledWidth: 40,
                        isborderSide: false,
                        controller: otp5,
                        keyboardType: TextInputType.number),
                    CustomTextField(
                        isOnChange: true,
                        contectPadding: EdgeInsets.all(0),
                        cursorHeight: 40,
                        textAlign: TextAlign.center,
                        maxValueofCharacter: 1,
                        onChange: (value) {
                          if (otp6.text.characters.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          } else {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        textStyle: TextStyle(color: primary, fontSize: 28),
                        textFilledHeight: 50,
                        textFilledWidth: 40,
                        isborderSide: false,
                        controller: otp6,
                        keyboardType: TextInputType.number),
                  ],
                ),
                const SizedBox(
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
                      onPressed: () {
                        var otp = otp1.text +
                            otp2.text +
                            otp3.text +
                            otp4.text +
                            otp5.text +
                            otp6.text;
                        print(otp);
                        if (otp == "895642") {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResetPassowordScreen()));
                        } else {
                          scaffoldMessage(
                              context: context, message: "Wrong otp");
                        }
                      }),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                    child: HelperText(
                  text: "Resend Code",
                  isUnderline: true,
                  fontsize: 15,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
