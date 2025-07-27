import 'package:devfolio/components/constants.dart';
import 'package:devfolio/components/social_media_coloumn.dart';
import 'package:devfolio/config/text_theme.dart';
import 'package:flutter/material.dart';

class SocialMediaIconList extends StatelessWidget {
  const SocialMediaIconList({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return TweenAnimationBuilder(tween: Tween(begin: 0.0,end: 1.0), duration: const Duration(milliseconds: 200), builder: (context, value, child) {
      return Transform.scale(scale: value,
      child:  Column(
        children: [
          const Spacer(),
          RotatedBox(
            quarterTurns: -3,
            child: Text('Follow Me',style: MyTextTheme.body.copyWith(
              fontWeight: FontWeight.w500,
            ),),
          ),
          Container(
            height: size.height*0.06,
            width: 3,
            margin: const EdgeInsets.symmetric(vertical: defaultPadding * 0.5),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(defaultPadding)
            ),
          ),
          const SocialMediaIconColumn(),
          const Spacer(),
        ],
      ),
      );
    },);
  }
}


