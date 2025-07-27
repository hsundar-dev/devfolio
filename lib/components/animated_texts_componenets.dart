import 'package:devfolio/components/Responsive.dart';
import 'package:devfolio/components/constants.dart';
import 'package:flutter/material.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({
    Key? key,
    this.height = 300,
    this.width = 250,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer> {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    // Scale up slightly for mobile
    final scaleFactor = isMobile ? 1.15 : 1.0;
    final adjustedWidth = widget.width! * scaleFactor;
    final adjustedHeight = widget.height! * scaleFactor;

    return SizedBox(
      height: adjustedHeight,
      width: adjustedWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(adjustedWidth / 2),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundImage: const AssetImage('assets/images/profile.png'),
        ),
      ),
    );
  }
}
