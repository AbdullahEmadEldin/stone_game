// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stone_game/core/app_assets.dart';
import 'package:stone_game/generated/l10n.dart';
import 'package:stone_game/logic/game_cubit/cubit/game_logic_cubit.dart';
import 'package:stone_game/service/game_logic.dart';
import 'package:stone_game/view/widgets/computer_card.dart';
import 'package:stone_game/view/widgets/play_card.dart';
import 'package:stone_game/view/widgets/side_menu.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        title: Text(S.of(context).startPaly),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<GameLogicCubit, GameLogicState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is ResultCalculatedSuccessfully) {
                print('in bloc builder::: ${state.compChoice}');
                return _buildComputerCardRow(state.compChoice);
              } else {
                return _buildComputerCardRow('computerChoice');
              }
            },
          ),
          _buildPlayerCardRow(context),
        ],
      ),
    );
  }

  Widget _buildPlayerCardRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlayerCard(
          cardName: gameChoices[0],
          imageAsset: AppAssets.sissor,
          invokeLoic: () {
            BlocProvider.of<GameLogicCubit>(context)
                .getGameResult(gameChoices[0]);
          },
          tweenOffset: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(1, -1.5),
          ),
        ),
        PlayerCard(
          cardName: gameChoices[1],
          imageAsset: AppAssets.paper,
          invokeLoic: () {
            BlocProvider.of<GameLogicCubit>(context)
                .getGameResult(gameChoices[1]);
          },
          tweenOffset: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(0, -1.5),
          ),
        ),
        PlayerCard(
          cardName: gameChoices[2],
          imageAsset: AppAssets.rock,
          invokeLoic: () {
            BlocProvider.of<GameLogicCubit>(context)
                .getGameResult(gameChoices[2]);
          },
          tweenOffset: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(-1, -1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildComputerCardRow(String computerChoice) {
    return Row(
      children: [
        ComputerCard(
            cardName: gameChoices[0],
            imageAsset: AppAssets.sissor,
            tweenOffset: Tween<Offset>(
              begin: const Offset(0, 0),
              end: const Offset(1, 1.5),
            ),
            computerChoice: computerChoice),
        ComputerCard(
            cardName: gameChoices[1],
            imageAsset: AppAssets.paper,
            tweenOffset: Tween<Offset>(
              begin: const Offset(0, 0),
              end: const Offset(0, 1.5),
            ),
            computerChoice: computerChoice),
        ComputerCard(
            cardName: gameChoices[2],
            imageAsset: AppAssets.rock,
            tweenOffset: Tween<Offset>(
              begin: const Offset(0, 0),
              end: const Offset(-1, 1.5),
            ),
            computerChoice: computerChoice),
      ],
    );
  }
}
