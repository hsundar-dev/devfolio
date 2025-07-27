import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:devfolio/components/Responsive.dart';
import 'package:devfolio/config/text_theme.dart';
import 'package:flutter/material.dart';

class TypingAnimationBanner extends StatefulWidget {
  const TypingAnimationBanner({super.key});

  @override
  State<TypingAnimationBanner> createState() => _TypingAnimationBannerState();
}

class _TypingAnimationBannerState extends State<TypingAnimationBanner> {
  bool _showCursor = false;

  final roles = const [
    'Flutter Developer',
    'Backend Developer',
    'AI Enthusiast',
    'Cybersecurity Learner',
    'Full-Stack Web Developer',
    'Open Source Contributor',
    'Cloud Practitioner',
  ];

  TextStyle _getResponsiveTextStyle(BuildContext context) {
    double fontSize;
    if (Responsive.isDesktop(context)) {
      fontSize = 32;
    } else if (Responsive.isTablet(context)) {
      fontSize = 28;
    } else if (Responsive.isLargeMobile(context)) {
      fontSize = 24;
    } else {
      fontSize = 20;
    }

    return MyTextTheme.headline.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = _getResponsiveTextStyle(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_showCursor) const SizedBox(width: 8), // Space before text
          Text(
            'an ',
            style: textStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(milliseconds: 1000),
            isRepeatingAnimation: true,
            onNext: (_, __) => setState(() => _showCursor = true),
            onNextBeforePause: (_, __) => setState(() => _showCursor = true),
            animatedTexts: roles.map((role) {
              return TyperAnimatedText(
                role,
                textStyle: textStyle,
                speed: const Duration(milliseconds: 80),
              );
            }).toList(),
          ),
          if (_showCursor) BlinkingIcon(fontSize: textStyle.fontSize ?? 24),
        ],
      ),
    );
  }
}

class BlinkingIcon extends StatefulWidget {
  final double fontSize;

  const BlinkingIcon({super.key, this.fontSize = 24.0});

  @override
  _BlinkingIconState createState() => _BlinkingIconState();
}

class _BlinkingIconState extends State<BlinkingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Text(
        "_",
        style: MyTextTheme.headline.copyWith(
          fontSize: widget.fontSize,
          color: Colors.black,
        ),
      ),
    );
  }
}
