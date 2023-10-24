import 'package:flutter/material.dart';
import '../../../../core/style/custom_colors.dart';
import '../../../../core/style/custom_text_style.dart';

class AuthTextFieldStyle {
  static OutlineInputBorder nonFocusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: CustomColors.white, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(20)));

  static OutlineInputBorder focusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: CustomColors.white, width: 2));

  static TextStyle errorTextStyle = CustomTextStyle.body2
      .copyWith(color: CustomColors.lightErrorMain, height: 1);

  static TextStyle labelTextStyle = CustomTextStyle.lightTypographyCaption
      .copyWith(color: CustomColors.black, height: 1.2);

  static TextStyle hintTextStyle =
      CustomTextStyle.body1.copyWith(color: CustomColors.black, height: 1.3);

  static TextStyle valueTextStyle =
      CustomTextStyle.body1.copyWith(color: CustomColors.black, height: 1.3);

  static EdgeInsets contentPadding =
      const EdgeInsets.symmetric(horizontal: 17, vertical: 14);

  static InputDecoration inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: contentPadding,
      border: nonFocusedBorder,
      enabledBorder: nonFocusedBorder,
      focusedBorder: focusedBorder,
      errorBorder: nonFocusedBorder,
      focusedErrorBorder: focusedBorder,
      errorStyle: errorTextStyle,
      labelStyle: labelTextStyle,
      hintStyle: hintTextStyle);
}
