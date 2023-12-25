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
      print('game record successssssssss:: $date,,,,, $gameResult');
    } catch (error) {
      print('History cuuuuuuuuuuuuubit errorr:: ${error.toString}');
    }
  }

  void getGameRecords() async {
    emit(LoadingHistory());
    print('1111111111   getGameRecordssssssssssssssssssss inside cubit');
    try {
      List<GameRecord> gameRecords = await _fetchRecords();
      print('3333333333   getGameRecordssssssssssssssssssss inside cubit:');
      emit(SuccessfulGameRecords(gameRecords: gameRecords));
    } catch (error) {
      print('History cuuuuuuuuuuuuubit:: ${error.toString}');
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
    print('2222222222   getGameRecordssssssssssssssssssss inside cubit:');
    return gameRecords;
  }
}
