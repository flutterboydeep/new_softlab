import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textFontSize;
  final FontWeight textFontWeight;

  final Color backgroundColor;

  final double borderRadius;
  final VoidCallback onPressed;
  final bool isBorderSide;
  final Color borderSideColor;
  final EdgeInsets padding;

  CustomButton({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.textFontSize = 15,
    this.textFontWeight = FontWeight.bold,
    this.backgroundColor = primary,
    this.borderRadius = 15,
    this.isBorderSide = false,
    required this.onPressed,
    this.borderSideColor = whiteText,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: isBorderSide == true
                ? BorderSide(color: borderSideColor, width: 1)
                : BorderSide.none,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: textFontSize,
              color: textColor,
              fontWeight: textFontWeight),
        ));
  }
}
