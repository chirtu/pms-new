import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final TextInputType keyboardType;
  final double fieldBorderRadius;

  // Optional fields with default values assigned in the initializer list
  final double? borderRadius;
  final double height;
  final double width;
  final double fontSize;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final double focusedBorderWidth;
  final Color? backgroundColor; // New background color property
  final Widget? prefixIcon;
  final Color? inputTextColor;
  final TextAlign? textAlign;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.fieldBorderRadius = 30.0,
    this.height = 50.0,
    this.width = 350.0,
    this.fontSize = 12.0,
    this.enabledBorderColor = const Color(0xFF663202),
    this.focusedBorderColor = const Color(0xFFE26A05),
    this.focusedBorderWidth = 2.0,
    this.backgroundColor,
    this.borderRadius = 30,
    this.prefixIcon,
    this.inputTextColor,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!)),
      child: TextField(
        controller: controller,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          fontSize: fontSize,
          color: inputTextColor,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(fieldBorderRadius),
            borderSide: BorderSide(
              color: enabledBorderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(fieldBorderRadius),
            borderSide: BorderSide(
              color: focusedBorderColor,
              width: focusedBorderWidth,
            ),
          ),
          filled:
              true, // Ensure the background color is applied inside the border
          fillColor: backgroundColor,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
