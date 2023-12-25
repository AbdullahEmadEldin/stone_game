class GameRecord {
  final int id;
  final String result, date;

  GameRecord({required this.id, required this.result, required this.date});
  factory GameRecord.fromJson(Map<String, dynamic> json) {
    return GameRecord(
        id: json['id'], result: json['result'], date: json['date']);
  }
}
