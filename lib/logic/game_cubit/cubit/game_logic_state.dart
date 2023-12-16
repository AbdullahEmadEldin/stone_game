part of 'game_logic_cubit.dart';

@immutable
sealed class GameLogicState {}

final class GameLogicInitial extends GameLogicState {}

final class ResultCalculatedSuccessfully extends GameLogicState {
  final String result;

  ResultCalculatedSuccessfully({required this.result});
}

final class Error extends GameLogicState {
  final String errorMsg;

  Error({required this.errorMsg});
}
