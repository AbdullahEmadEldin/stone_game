// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class PlayerCard extends StatefulWidget {
  final String imageAsset;
  final String cardName;
  final Tween<Offset> tweenOffset;
  final Function invokeLoic;
  final bool isDisabled;
  final bool reset;
  const PlayerCard({
    Key? key,
    required this.cardName,
    required this.imageAsset,
    required this.tweenOffset,
    required this.invokeLoic,
    required this.isDisabled,
    required this.reset,
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
  void didUpdateWidget(covariant PlayerCard oldWidget) {
    if (widget.reset != oldWidget.reset) {
      _controller.reset();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.isDisabled
            ? null
            : () async {
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
