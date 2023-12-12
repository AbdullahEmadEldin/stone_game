import 'package:flutter/material.dart';
import 'package:stone_game/core/localization/generated/l10n.dart';
import 'package:stone_game/core/theme/app_theme.dart';
import 'package:stone_game/core/theme/theme_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const StoneGameApp());
}

ThemeManager _themeManager = ThemeManager();

class StoneGameApp extends StatefulWidget {
  const StoneGameApp({super.key});

  @override
  State<StoneGameApp> createState() => _StoneGameAppState();
}

class _StoneGameAppState extends State<StoneGameApp> {
  @override

  ///these listners for switching theme
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightAppTheme,
      darkTheme: AppThemes.darkAppTheme,
      themeMode: _themeManager.themeMode,
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
