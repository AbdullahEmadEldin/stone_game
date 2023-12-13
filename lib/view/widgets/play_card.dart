import 'package:flutter/material.dart';

class PlayCard extends StatelessWidget {
  final String imageAsset;
  final String cardName;
  final bool textUp;
  const PlayCard(
      {Key? key,
      required this.cardName,
      required this.imageAsset,
      required this.textUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textUp
            ? Text(
                cardName,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : const SizedBox(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Image.asset(imageAsset),
        ),
        textUp
            ? const SizedBox()
            : Text(
                cardName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
      ],
    );
  }
}
