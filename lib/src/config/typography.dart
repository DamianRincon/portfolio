import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio/src/config/colors.dart';

TextStyle headlineTextStyle = GoogleFonts.montserrat(
  textStyle: const TextStyle(
    fontSize: 26,
    color: textPrimary,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w500,
  ),
);

TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
  textStyle: const TextStyle(
    fontSize: 20,
    color: textPrimary,
    fontWeight: FontWeight.w300,
  ),
);

TextStyle subtitleTextStyle = GoogleFonts.openSans(
  textStyle: const TextStyle(
    fontSize: 14,
    color: textSecondary,
    letterSpacing: 1,
  ),
);

TextStyle bodyTextStyle = GoogleFonts.openSans(
  textStyle: const TextStyle(fontSize: 14, color: textPrimary),
);

TextStyle buttonTextStyle = GoogleFonts.montserrat(
  textStyle: const TextStyle(
    fontSize: 14,
    color: textPrimary,
    letterSpacing: 1,
  ),
);

ButtonStyle menuButtonStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all(Colors.transparent),
  overlayColor: WidgetStateProperty.all(Colors.transparent),
  padding: WidgetStateProperty.all(
    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  ),
  foregroundColor: WidgetStateProperty.all(Colors.black),
  textStyle: WidgetStateProperty.resolveWith<TextStyle?>((
    Set<WidgetState> states,
  ) {
    if (states.contains(WidgetState.hovered)) {
      return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        decorationColor: Colors.black,
      );
    }
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      decorationColor: Colors.black,
    );
  }),
);
