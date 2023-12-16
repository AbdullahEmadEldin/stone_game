import 'package:flutter/material.dart';
import 'package:stone_game/core/theme/app_theme.dart';

class AppTextThemes {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: kLightColorScheme.onPrimaryContainer,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: kLightColorScheme.onPrimaryContainer,
    ),
    displayLarge: TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: kLightColorScheme.onPrimaryContainer,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: kLightColorScheme.onPrimaryContainer,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: kLightColorScheme.onPrimaryContainer,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: kLightColorScheme.onPrimaryContainer,
    ),
  );
// 2
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: kDarkColorScheme.onPrimary,
    ),
    displayLarge: TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: kDarkColorScheme.onPrimary,
    ),
    displayMedium: const TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: kDarkColorScheme.onPrimary,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Cairo-VariableFont_slnt,wght',
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: kDarkColorScheme.onPrimary,
    ),
  );
}
