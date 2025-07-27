import 'package:flutter/material.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText({
    super.key,
    required this.start,
    required this.end,
  });

  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          '“I don\'t rely on luck or chance — I pursue success with unwavering commitment and purpose.”\n— This is my Nindo.',
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: value,
            fontStyle: FontStyle.italic,
            wordSpacing: 2,
          ),
        );
      },
    );
  }
}
