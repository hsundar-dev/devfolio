import 'package:devfolio/config/text_theme.dart';
import 'package:flutter/material.dart';

class MyPortfolioText extends StatelessWidget {
  const MyPortfolioText({super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return Text(
          'I AM HEMASUNDAR',
          style: MyTextTheme.headline.copyWith(
            fontWeight: FontWeight.w900,
            fontSize: value,
            height: 1.1, // Slightly spaced lines (better than 0)
          ),
        );
      },
    );
  }
}
