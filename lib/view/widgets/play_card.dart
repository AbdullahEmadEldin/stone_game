// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:stone_game/core/locator.dart';
import 'package:stone_game/service/game_logic.dart';

class PlayerCard extends StatefulWidget {
  final String imageAsset;
  final String cardName;
  final Tween<Offset> tweenOffset;
  final Function invokeLoic;
  const PlayerCard({
    Key? key,
    required this.cardName,
    required this.imageAsset,
    required this.tweenOffset,
    required this.invokeLoic,
  }) : super(key: key);

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animation = widget.tweenOffset.animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          _buildPlayerAnimationLogic(widget.invokeLoic);
        },
        child: SlideTransition(
            position: _animation, child: _buildPlayCard(context)));
  }

  Column _buildPlayCard(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Image.asset(widget.imageAsset),
        ),
        Text(
          widget.cardName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  _buildPlayerAnimationLogic(Function invokeLogic) async {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    invokeLogic();
  }
}
