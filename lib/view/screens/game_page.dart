import 'package:flutter/material.dart';
import 'package:stone_game/core/app_assets.dart';
import 'package:stone_game/generated/l10n.dart';
import 'package:stone_game/view/widgets/play_card.dart';
import 'package:stone_game/view/widgets/side_menu.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        title: Text(S.of(context).startPaly),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCardRow(textUp: true),
          _buildCardRow(textUp: false),
        ],
      ),
    );
  }

  Widget _buildCardRow({required bool textUp}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlayCard(
          cardName: 'Sissor',
          imageAsset: AppAssets.sissor,
          textUp: textUp,
          tweenOffset: Tween<Offset>(
            begin: const Offset(0, 0),
            end: textUp ? const Offset(1, 1.5) : const Offset(1, -1.5),
          ),
        ),
        PlayCard(
          cardName: 'Paper',
          imageAsset: AppAssets.paper,
          textUp: textUp,
          tweenOffset: Tween<Offset>(
            begin: const Offset(0, 0),
            end: textUp ? const Offset(0, 1.5) : const Offset(0, -1.5),
          ),
        ),
        PlayCard(
          cardName: 'Rock',
          imageAsset: AppAssets.rock,
          textUp: textUp,
          tweenOffset: Tween<Offset>(
            begin: const Offset(0, 0),
            end: textUp ? const Offset(-1, 1.5) : const Offset(-1, -1.5),
          ),
        ),
      ],
    );
  }
}
