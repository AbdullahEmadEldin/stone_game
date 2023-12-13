import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stone_game/core/navigation/routes.dart';
import 'dart:async';

import 'package:stone_game/view/widgets/animation_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => context.goNamed(AppRoutes.gameScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LogoAnimation(),
      ),
    );
  }
}
