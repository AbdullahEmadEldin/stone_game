import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stone_game/service/game_logic.dart';

part 'game_logic_state.dart';

class GameLogicCubit extends Cubit<GameLogicState> {
  final GameLogicAPI gameLogicAPI;
  GameLogicCubit({required this.gameLogicAPI}) : super(GameLogicInitial());

  void getGameResult(String playerChoice) async {
    try {
      final String compChoice =
          await gameLogicAPI.randomComputerChoice(gameChoices);
      final String result = gameLogicAPI.gameResult(
          playerChoice: playerChoice, compChoice: compChoice);
      emit(
          ResultCalculatedSuccessfully(result: result, compChoice: compChoice));
      print(
          '==comp ==$compChoice=======================player=$playerChoice=====$result');
    } catch (error) {
      print('SOme fucking error on game logic result:::: ${error.toString}');
      emit(Error(errorMsg: error.toString()));
    }
  }
}
