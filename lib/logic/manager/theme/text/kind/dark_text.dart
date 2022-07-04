import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../text_manager.dart';

class DarkText implements ITextManager {
  @override
  TextStyle? bodyText1;

  @override
  TextStyle? bodyText2;

  @override
  late final TextTheme data;

  @override
  String? fontFamily;

  @override
  TextStyle? headline1;

  @override
  TextStyle? headline3;

  @override
  TextStyle? headline4;

  @override
  TextStyle? headline5;

  @override
  TextStyle? headline6;

  @override
  TextStyle? subtitle1;

  @override
  TextStyle? subtitle2;

  @override
  final Color? primaryColor;

  DarkText(this.primaryColor) {
    data = TextTheme(
      headline1: GoogleFonts.roboto(
          fontSize: 96.sp, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.roboto(
          fontSize: 60.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.roboto(
          fontSize: 34.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.roboto(
          fontSize: 20.sp, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.roboto(
          fontSize: 16.sp, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.roboto(
          fontSize: 14.sp, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.roboto(
          fontSize: 16.sp, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.roboto(
          fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    ).apply(bodyColor: primaryColor);

    fontFamily = GoogleFonts.arvo().fontFamily;
  }
}
