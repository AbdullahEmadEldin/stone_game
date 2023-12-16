import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stone_game/service/game_logic.dart';

part 'game_logic_state.dart';

class GameLogicCubit extends Cubit<GameLogicState> {
  final GameLogicAPI gameLogicAPI;
  GameLogicCubit({required this.gameLogicAPI}) : super(GameLogicInitial());

  void getGameResult(String playerChoice) async {
    try {
      await gameLogicAPI
          .gameResult(playerChoice: playerChoice)
          .then((result) => emit(ResultCalculatedSuccessfully(result: result)));
    } catch (error) {
      print('SOme fucking error on game logic result:::: ${error.toString}');
      emit(Error(errorMsg: error.toString()));
    }
  }
}
