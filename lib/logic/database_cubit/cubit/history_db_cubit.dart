// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stone_game/data/models/game_record.dart';
import 'package:stone_game/service/sql/database_service.dart';

part 'history_db_state.dart';

class HistoryDbCubit extends Cubit<HistoryDbState> {
  PlayHistoryDB playHistoryDB = PlayHistoryDB();
  HistoryDbCubit() : super(HistoryDbInitial());

  void recordGame({required String date, required String gameResult}) async {
    try {
      await playHistoryDB.createData(
          "INSERT INTO history ('date','result') VALUES ('$date','$gameResult')");
    } catch (error) {
      print('History cuuuuuuuuuuuuubit errorr:: ${error.toString}');
    }
  }

  void getGameRecords() async {
    emit(LoadingHistory());
    try {
      List<GameRecord> gameRecords = await _fetchRecords();
      emit(SuccessfulGameRecords(gameRecords: gameRecords));
    } catch (error) {
      print('erorrrr in get game recordsss cubit');
    }
  }

  deleteGameHistory() async {
    await playHistoryDB.deleteData("DELETE FROM 'history'");
  }

  Future<List<GameRecord>> _fetchRecords() async {
    List<Map<String, dynamic>> records =
        await playHistoryDB.readData("SELECT * FROM 'history'");
    List<GameRecord> gameRecords = records
        .map(
          (record) => GameRecord.fromJson(record),
        )
        .toList();
    return gameRecords;
  }
}
