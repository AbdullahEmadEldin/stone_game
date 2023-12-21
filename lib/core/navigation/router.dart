import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stone_game/core/navigation/routes.dart';
import 'package:stone_game/logic/game_cubit/cubit/game_logic_cubit.dart';
import 'package:stone_game/service/game_logic.dart';
import 'package:stone_game/view/screens/game_page.dart';
import 'package:stone_game/view/screens/history_screen.dart';
import 'package:stone_game/view/screens/settings_screen.dart';
import 'package:stone_game/view/screens/splash_screen.dart';

class AppRouter {
  static GoRouter router() {
    return GoRouter(
      initialLocation: '/gamePage',
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
              return MaterialPage(
                  child: BlocProvider(
                create: (context) => GameLogicCubit(gameLogicAPI: GameLogic()),
                child: GamePage(),
              ));
            },
            routes: [
              GoRoute(
                name: AppRoutes.settingsScreen,
                path: 'settings',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: SettingsScreen());
                },
              ),
              GoRoute(
                name: AppRoutes.historyScreen,
                path: 'history',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: HistoryScreen());
                },
              )
            ])
      ],
    );
  }
}
