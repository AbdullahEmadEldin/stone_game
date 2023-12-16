// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ComputerCard extends StatefulWidget {
  final String imageAsset;
  final String cardName;
  final String computerChoice;
  final Tween<Offset> tweenOffset;
  const ComputerCard({
    Key? key,
    required this.cardName,
    required this.imageAsset,
    required this.tweenOffset,
    required this.computerChoice,
  }) : super(key: key);

  @override
  State<ComputerCard> createState() => _ComputerCardState();
}

class _ComputerCardState extends State<ComputerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = widget.tweenOffset.animate(_controller);

    print(
        '=from INIT state=====${widget.computerChoice}================================${widget.cardName == widget.computerChoice}');
    super.initState();
  }

  @override
  void didUpdateWidget(ComputerCard oldCard) {
    super.didUpdateWidget(oldCard);

    if (widget.computerChoice != oldCard.computerChoice) {
      if (widget.cardName == widget.computerChoice) {
        _controller.forward();
      }
    }

    print(
        '=from didUpdateWidget=====${widget.computerChoice}================================${widget.cardName == widget.computerChoice}');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _animation, child: _buildPlayCard(context));
  }

  Column _buildPlayCard(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.cardName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Image.asset(widget.imageAsset),
        ),
      ],
    );
  }
}
