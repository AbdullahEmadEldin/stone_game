import 'package:flutter/material.dart';
import 'package:stone_game/core/theme/app_theme.dart';
import 'package:stone_game/data/models/game_record.dart';
import 'package:stone_game/generated/l10n.dart';

class GamerecordTile extends StatelessWidget {
  final GameRecord gameRecord;
  const GamerecordTile({Key? key, required this.gameRecord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white54,
      elevation: 5,
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Card(
        color: Colors.grey,
        shape: CircleBorder(eccentricity: 0.1),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.11,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${S.of(context).gameNo} ${gameRecord.id}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '${S.of(context).date} ${gameRecord.date}',
                    )
                  ],
                ),
                Text(S.of(context).result),
                Text(
                  gameRecord.result,
                  style: TextStyle(color: kLightColorScheme.primary),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
