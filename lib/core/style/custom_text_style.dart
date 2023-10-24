import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';

class CustomTextStyle {
  static final TextStyle _textStyle =
      GoogleFonts.instrumentSans(color: CustomColors.white);

  static TextStyle get h1 {
    double fontSize = 92;
    return _textStyle.copyWith(
        fontSize: fontSize,
        letterSpacing: 1.5,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 92),
        fontWeight: CustomFontWeight.thin.value);
  }

  static TextStyle get h2 {
    double fontSize = 60;
    return _textStyle.copyWith(
        fontSize: fontSize,
        letterSpacing: 1.5,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 40),
        fontWeight: CustomFontWeight.medium.value);
  }

  static TextStyle get h3 {
    double fontSize = 32;
    return _textStyle.copyWith(
        fontSize: fontSize,
        letterSpacing: 0,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 32),
        fontWeight: CustomFontWeight.medium.value);
  }

  static TextStyle get h5 {
    double fontSize = 24;
    return _textStyle.copyWith(
        fontSize: fontSize,
        letterSpacing: 0,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 32.02),
        fontWeight: CustomFontWeight.extraBold.value);
  }

  static TextStyle h6 = _textStyle.copyWith(
      fontSize: 22, height: 1.2, fontWeight: CustomFontWeight.bold.value);

  static TextStyle h7 = _textStyle.copyWith(
      fontSize: 19, height: 1.2, fontWeight: CustomFontWeight.extraBold.value);

  static TextStyle get lightComponentsChip {
    double fontSize = 13;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 18),
        fontWeight: CustomFontWeight.regular.value);
  }

  static TextStyle lightTypographyCaption = _textStyle.copyWith(
      fontSize: 12,
      height: 1.2,
      fontWeight: CustomFontWeight.regular.value,
      letterSpacing: 0.4);

  static TextStyle lightComponentsButtonLarge = _textStyle.copyWith(
      fontSize: 15,
      height: 1.2,
      fontWeight: CustomFontWeight.medium.value,
      letterSpacing: 0.46);

  static TextStyle lightTypographyBody1SemiBold = _textStyle.copyWith(
    fontSize: 16,
    height: 1.2,
    fontWeight: CustomFontWeight.semiBold.value,
    letterSpacing: 0.15,
  );

  static TextStyle lightTypographyBody1 = _textStyle.copyWith(
    fontSize: 16,
    height: 1.2,
    fontWeight: CustomFontWeight.regular.value,
    letterSpacing: 0.15,
  );

  static TextStyle lightTypographyBody2 = _textStyle.copyWith(
    fontSize: 14,
    height: 1.2,
    fontWeight: CustomFontWeight.regular.value,
    letterSpacing: 0.15,
  );

  static TextStyle get body1SemiBold {
    double fontSize = 16;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 24),
        fontWeight: CustomFontWeight.bold.value,
        letterSpacing: 1);
  }

  static TextStyle get body1 {
    double fontSize = 18;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 24),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.15);
  }

  static TextStyle get body2 {
    double fontSize = 14;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 24),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.15);
  }

  static TextStyle body2SemiBold = _textStyle.copyWith(
      fontSize: 14,
      height: 1.2,
      fontWeight: CustomFontWeight.semiBold.value,
      letterSpacing: 0.15);

  static TextStyle lightComponentInputText = _textStyle.copyWith(
      letterSpacing: 0.15,
      fontSize: 16,
      height: 1.2,
      fontWeight: CustomFontWeight.regular.value);

  static TextStyle get lightComponentInputLabel {
    double fontSize = 13;
    return _textStyle.copyWith(
        letterSpacing: 0.3,
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 18),
        fontWeight: CustomFontWeight.regular.value);
  }
}

double _fontHeight(
        {required double fontSize, required double figmaLineHeight}) =>
    figmaLineHeight / fontSize;

enum CustomFontWeight {
  thin(FontWeight.w100),
  extraLight(FontWeight.w200),
  light(FontWeight.w300),
  regular(FontWeight.w400),
  medium(FontWeight.w500),
  semiBold(FontWeight.w600),
  bold(FontWeight.w700),
  extraBold(FontWeight.w800);

  final FontWeight value;

  const CustomFontWeight(this.value);
}
