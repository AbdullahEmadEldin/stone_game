import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stone_game/core/navigation/routes.dart';
import 'package:stone_game/view/screens/game_page.dart';
import 'package:stone_game/view/screens/settings_screen.dart';
import 'package:stone_game/view/screens/splash_screen.dart';

class AppRouter {
  static GoRouter router() {
    return GoRouter(
      initialLocation: '/splashScreen',
      routes: [
        GoRoute(
          name: AppRoutes.splash,
          path: '/splashScreen',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SplashScreen());
          },
        ),
        GoRoute(
            name: AppRoutes.gameScreen,
            path: '/gamePage',
            pageBuilder: (context, state) {
              return const MaterialPage(child: GamePage());
            },
            routes: [
              GoRoute(
                name: AppRoutes.settingsScreen,
                path: 'settings',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: SettingsScreen());
                },
              )
            ])
      ],
    );
  }
}
