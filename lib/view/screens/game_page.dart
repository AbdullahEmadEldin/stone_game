// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stone_game/core/app_assets.dart';
import 'package:stone_game/core/locator.dart';
import 'package:stone_game/generated/l10n.dart';
import 'package:stone_game/logic/database_cubit/cubit/history_db_cubit.dart';
import 'package:stone_game/logic/game_cubit/cubit/game_logic_cubit.dart';
import 'package:stone_game/service/game_logic.dart';
import 'package:stone_game/view/widgets/computer_card.dart';
import 'package:stone_game/view/widgets/play_card.dart';
import 'package:stone_game/view/widgets/side_menu.dart';

class GamePage extends StatefulWidget {
  GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String? _gameResult;
  DateTime? date;
  String _computerChoice = '';
  bool reset = false;

  ///for restrict the player movement to one move per the game
  bool isDisabled1 = false;
  bool isDisabled2 = false;
  bool isDisabled3 = false;
  void handleTap(int index) {
    setState(() {
      if (index == 0) {
        isDisabled2 = true;
        isDisabled3 = true;
      } else if (index == 1) {
        isDisabled1 = true;
        isDisabled3 = true;
      } else if (index == 2) {
        isDisabled1 = true;
        isDisabled2 = true;
      }
    });
  }

  ///Reset animation
  void resetGame() {
    setState(() {
      isDisabled1 = false;
      isDisabled2 = false;
      isDisabled3 = false;
      _computerChoice = '0xFF';
      reset = !reset;
      //? I had to reset the state of the cubit it self
      //? because it keeps the value of computerChoice of the previous game
      //? and this make a problem on reset when the compChoice repeated in 2 successing games

      final state = BlocProvider.of<GameLogicCubit>(context).state;
      if (state is ResultCalculatedSuccessfully) {
        state.compChoice = _computerChoice;
      }
    });
  }

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
            builder: (context, state) {
              if (state is ResultCalculatedSuccessfully) {
                date = DateTime.now();
                _gameResult = state.result;

                _computerChoice = state.compChoice;
                print(
                    'in bloc builder::: compChoice ${_computerChoice}---------------$_gameResult');
                return _buildComputerCardRow();
              } else {
                return _buildComputerCardRow();
              }
            },
          ),
          _showGameResult(),
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
          isDisabled: isDisabled1,
          reset: reset,
          invokeLoic: () {
            handleTap(0);
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
          isDisabled: isDisabled2,
          reset: reset,
          invokeLoic: () {
            handleTap(1);
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
          isDisabled: isDisabled3,
          reset: reset,
          invokeLoic: () {
            handleTap(2);
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

  Widget _buildComputerCardRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ComputerCard(
            cardName: gameChoices[0],
            imageAsset: AppAssets.sissor,
            reset: reset,
            tweenOffset: Tween<Offset>(
              begin: const Offset(0, 0),
              end: const Offset(1, 1.5),
            ),
            computerChoice: _computerChoice),
        ComputerCard(
            cardName: gameChoices[1],
            imageAsset: AppAssets.paper,
            reset: reset,
            tweenOffset: Tween<Offset>(
              begin: const Offset(0, 0),
              end: const Offset(0, 1.5),
            ),
            computerChoice: _computerChoice),
        ComputerCard(
            cardName: gameChoices[2],
            imageAsset: AppAssets.rock,
            reset: reset,
            tweenOffset: Tween<Offset>(
              begin: const Offset(0, 0),
              end: const Offset(-1, 1.5),
            ),
            computerChoice: _computerChoice),
      ],
    );
  }

  //? we wrapped showDialog with a builder because it's a (overlay widget) type and it's a child of the screen
//? and without the builder the parent and the child are being built in the same time wich is exception
  Builder _showGameResult() {
    return Builder(builder: (context) {
      return BlocListener<GameLogicCubit, GameLogicState>(
        listener: (context, state) {
          if (state is ResultCalculatedSuccessfully) {
            Future.delayed(const Duration(milliseconds: 1500), () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              _gameResult!,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          )),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                BlocProvider.of<HistoryDbCubit>(context).recordGame(
                                    date:
                                        '${date!.day}-${date!.month}-${date!.year}',
                                    gameResult: _gameResult!);
                                resetGame();
                                context.pop();
                              },
                              child: Text('Reset'))
                        ],
                      ));
            });
          }
        },
        child: const SizedBox(height: 0.1),
      );
    });
  }
}
