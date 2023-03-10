import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinder/src/themes/app_color.dart';
import 'package:tinder/src/themes/app_font.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColor.primary,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.primary, elevation: 0),
    fontFamily: AppFontFamily.poppins,
  );
}

class AppSpace {
  static Widget vertical(double value) {
    return SizedBox(height: value);
  }

  static Widget horizontal(double value) {
    return SizedBox(width: value);
  }
}

class AppTextStyle {
  static TextStyle white({
    double fontSize = AppFontSize.f16,
    FontWeight fontWeight = AppFontWeight.regular,
  }) {
    return _getTextStyle(
      fontSize,
      AppFontFamily.poppins,
      fontWeight,
      AppColor.white,
    );
  }

  static TextStyle black60({
    double fontSize = AppFontSize.f16,
    FontWeight fontWeight = AppFontWeight.regular,
  }) {
    return _getTextStyle(
      fontSize,
      AppFontFamily.poppins,
      fontWeight,
      AppColor.black60,
    );
  }

  static TextStyle black30({
    double fontSize = AppFontSize.f16,
    FontWeight fontWeight = AppFontWeight.regular,
  }) {
    return _getTextStyle(
      fontSize,
      AppFontFamily.poppins,
      fontWeight,
      AppColor.black30,
    );
  }

  static TextStyle black({
    double fontSize = AppFontSize.f16,
    FontWeight fontWeight = AppFontWeight.regular,
  }) {
    return _getTextStyle(
      fontSize,
      AppFontFamily.poppins,
      fontWeight,
      AppColor.black,
    );
  }

  static TextStyle grey60({
    double fontSize = AppFontSize.f14,
    FontWeight fontWeight = AppFontWeight.regular,
  }) {
    return _getTextStyle(
      fontSize,
      AppFontFamily.poppins,
      fontWeight,
      AppColor.grey60,
    );
  }
}

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return GoogleFonts.poppins().copyWith(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}
