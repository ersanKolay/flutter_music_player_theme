import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicPlayerTheme {
  MusicPlayerTheme._();

  static const darkColor = Color(0xff2c3238);
  static const grayColor = Color(0xffd4d4d0);

  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xff202053),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.nunito(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff202053),
        ),
        textTheme: textTheme,
      );

  static TextTheme get textTheme {
    return TextTheme(
      caption: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline6: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      headline5: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline4: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      headline3: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      headline2: GoogleFonts.montserrat(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      headline1: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
