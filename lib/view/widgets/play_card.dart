// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PlayCard extends StatefulWidget {
  final String imageAsset;
  final String cardName;
  final bool textUp;
  final Tween<Offset> tweenOffset;
  const PlayCard(
      {Key? key,
      required this.cardName,
      required this.imageAsset,
      required this.textUp,
      required this.tweenOffset})
      : super(key: key);

  @override
  State<PlayCard> createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard>
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
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: SlideTransition(
            position: _animation, child: _buildPlayCard(context)));
  }

  Column _buildPlayCard(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.textUp
            ? Text(
                widget.cardName,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : const SizedBox(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Image.asset(widget.imageAsset),
        ),
        widget.textUp
            ? const SizedBox()
            : Text(
                widget.cardName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
      ],
    );
  }
}
