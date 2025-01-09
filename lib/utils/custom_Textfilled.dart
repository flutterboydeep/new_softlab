import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/colors.dart';

class CustomTextField extends StatelessWidget {
  final bool isRequired;
  final TextEditingController controller;
  final bool isPass;
  final TextInputType keyboardType;
  final bool isPrefix;
  final Widget prefix;
  final Widget suffix;
  final EdgeInsetsGeometry contectPadding;
  final String hintText;
  final TextStyle textStyle;
  final double textFilledWidth;
  final double textFilledHeight;
  final String errorMessage;
  final bool isborderSide;
  final double cursorHeight;
  final Color fillColor;
  final String prefixText;
  final bool isSuffix;
  final onChange;
  final TextAlign textAlign;
  final bool isOnChange;

  final int maxValueofCharacter;

  // final  TextFormField textFromField;

  CustomTextField({
    super.key,
    this.isRequired = true,
    required this.controller,
    this.isPass = false,
    required this.keyboardType,
    this.isPrefix = false,
    this.prefix = const SizedBox(
      height: 0,
      width: 0,
    ),
    this.isSuffix = false,
    this.suffix = const SizedBox(
      height: 0,
      width: 0,
    ),
    this.contectPadding = const EdgeInsets.all(10),
    this.hintText = '',
    this.textStyle = const TextStyle(
      fontSize: 18,
      color: greyColor,
    ),
    this.textFilledHeight = 400,
    this.textFilledWidth = 420,
    this.errorMessage = '',
    this.isborderSide = true,
    this.fillColor = const Color.fromARGB(196, 237, 236, 236),
    this.cursorHeight = 23,
    this.prefixText = "",
    this.onChange = (),
    this.maxValueofCharacter = 100,
    this.textAlign = TextAlign.start,
    this.isOnChange = false,
  });
  test() {}
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: BoxDecoration(border: Border.all(width: 2)),
      height: textFilledHeight,
      width: textFilledWidth,
      child: TextFormField(
          //  textInputAction: TextInputAction.previous,
          textAlign: textAlign,
          cursorHeight: cursorHeight,
          style: textStyle,
          obscureText: isPass ? true : false,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxValueofCharacter),
            // FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) => isOnChange ? onChange(value) : null,
          decoration: InputDecoration(
            // constraints: BoxConstraints(maxHeight: 400,minHeight: 300),
            suffixIcon: isSuffix ? suffix : null,
            // prefixIconConstraints: BoxConstraints(maxWidth: 15),
            // state.isHidePassword == true
            //     ? Icons.visibility_off
            //     : Icons.visibility,

            fillColor: fillColor,
            filled: true,
            prefixText: prefixText,

            prefixIcon: isPrefix ? prefix : null,

            // : Padding(padding: EdgeInsets.all(30)),
            contentPadding: contectPadding,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: isborderSide
                  ? BorderSide(color: greyColor, width: 2)
                  : BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none,
              // borderSide: BorderSide(
              //   color: Color.fromARGB(255, 244, 54, 54),
              //   width: 1,
              // ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none,
            ),

            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: isborderSide
                    ? BorderSide(color: Colors.grey, width: 1)
                    : BorderSide.none),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade400,
                fontFamily: 'vietnam'),
            // prefixIcon: isPrefix?prefix:null,
          ),
          // validator: validator,
          validator: (value) {
            if (isRequired == true && value!.isEmpty) {
              return "$value Fields are required";
            } else if (isPass == true && value!.length < 6) {
              return "Password can not small form 6 Character";
            } else {
              return null;
            }
          }),
    );
  }
}
