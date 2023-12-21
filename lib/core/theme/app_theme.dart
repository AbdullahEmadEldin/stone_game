import 'package:flutter/material.dart';
import 'package:stone_game/core/theme/text.theme.dart';

final kLightColorScheme =
    ColorScheme.fromSeed(seedColor: const Color(0xff00C8C8));
final kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xff18604A), brightness: Brightness.dark);

class AppThemes {
// 1

// 3
  static ThemeData lightAppTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: kLightColorScheme,
    scaffoldBackgroundColor: kLightColorScheme.background,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          return Colors.black;
        },
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kLightColorScheme.primary,
      foregroundColor: kLightColorScheme.onPrimary,
      elevation: 5,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kLightColorScheme.primary,
        foregroundColor: kLightColorScheme.onPrimary,
        elevation: 8),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.green,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: kLightColorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 6,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)))),
    ),
    textTheme: AppTextThemes.lightTextTheme,
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: kDarkColorScheme.primary),
    cardTheme: CardTheme(
      clipBehavior: Clip.none,
      color: kLightColorScheme.primary,
    ),
    iconTheme: IconThemeData(color: kLightColorScheme.primary),
    primaryIconTheme: IconThemeData(color: kLightColorScheme.primary),
    dialogTheme: DialogTheme(
      backgroundColor: kLightColorScheme.primaryContainer,
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ),
  );

// 4
  static ThemeData darkAppTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kDarkColorScheme.shadow,
    appBarTheme: AppBarTheme(
      backgroundColor: kDarkColorScheme.primary,
      foregroundColor: kDarkColorScheme.onSecondary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kDarkColorScheme.secondary,
      foregroundColor: kDarkColorScheme.onSecondary,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.green,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: kLightColorScheme.inversePrimary,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          minimumSize: const Size(130, 70)),
    ),
    textTheme: AppTextThemes.darkTextTheme,
  );
}
