import 'package:flutter/material.dart';
import 'package:stone_game/core/app_assets.dart';
import 'package:stone_game/generated/l10n.dart';
import 'package:stone_game/view/widgets/play_card.dart';
import 'package:stone_game/view/widgets/side_menu.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        title: Text(S.of(context).startPaly),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlayCard(
                cardName: 'Sissor',
                imageAsset: AppAssets.sissor,
                textUp: true,
              ),
              PlayCard(
                cardName: 'Paper',
                imageAsset: AppAssets.paper,
                textUp: true,
              ),
              PlayCard(
                cardName: 'Rock',
                imageAsset: AppAssets.rock,
                textUp: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
