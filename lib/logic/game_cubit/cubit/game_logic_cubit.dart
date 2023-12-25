import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stone_game/service/game_logic.dart';

part 'game_logic_state.dart';

class GameLogicCubit extends Cubit<GameLogicState> {
  final GameLogicAPI gameLogicAPI;
  GameLogicCubit({required this.gameLogicAPI}) : super(GameLogicInitial());
  String compChoice = '';
  
  void getGameResult(String playerChoice) async {
    try {
      compChoice = await gameLogicAPI.randomComputerChoice(gameChoices);
      final String result = gameLogicAPI.gameResult(
          playerChoice: playerChoice, compChoice: compChoice);
      emit(
          ResultCalculatedSuccessfully(result: result, compChoice: compChoice));
    } catch (error) {
      emit(Error(errorMsg: error.toString()));
    }
  }

  @override
  Future<void> close() {
    compChoice = '2222';
    return super.close();
  }
}
