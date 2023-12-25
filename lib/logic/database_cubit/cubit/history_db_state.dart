part of 'history_db_cubit.dart';

@immutable
sealed class HistoryDbState {}

final class HistoryDbInitial extends HistoryDbState {}

final class SuccessfulGameRecords extends HistoryDbState {
  final List<GameRecord> gameRecords;

  SuccessfulGameRecords({required this.gameRecords});
}

final class LoadingHistory extends HistoryDbState {}
