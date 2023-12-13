import 'package:flutter/material.dart';
import 'package:stone_game/core/localization/localization_manager.dart';
import 'package:stone_game/core/locator.dart';
import 'package:stone_game/core/navigation/router.dart';
import 'package:stone_game/core/theme/app_theme.dart';
import 'package:stone_game/core/theme/theme_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stone_game/generated/l10n.dart';

void main() {
  setUp();
  runApp(const StoneGameApp());
}

class StoneGameApp extends StatefulWidget {
  const StoneGameApp({super.key});

  @override
  State<StoneGameApp> createState() => _StoneGameAppState();
}

class _StoneGameAppState extends State<StoneGameApp> {
  @override

  ///these listners for switching theme
  void dispose() {
    locator.get<ThemeManager>().removeListener(themeListener);
    locator.get<LocalizationManager>().removeListener(languageLisnter);
    super.dispose();
  }

  @override
  void initState() {
    locator.get<ThemeManager>().addListener(themeListener);
    locator.get<LocalizationManager>().addListener(languageLisnter);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  languageLisnter() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router(),
      locale: locator.get<LocalizationManager>().appLanguage,
      debugShowCheckedModeBanner: false,
      theme: locator.get<ThemeData>(),
      darkTheme: AppThemes.darkAppTheme,
      themeMode: locator.get<ThemeManager>().themeMode,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
