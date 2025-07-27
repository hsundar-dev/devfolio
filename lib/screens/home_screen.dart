import 'package:devfolio/components/Responsive.dart';
import 'package:devfolio/components/intro_body.dart';
import 'package:devfolio/components/social_media_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.01,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.02,
          ),
          if (!Responsive.isLargeMobile(context)) ...{
            const SocialMediaIconList(),
            SizedBox(
              width: MediaQuery
                  .sizeOf(context)
                  .width * 0.07,
            ),
          },
          Expanded(
            child: IntroBody(),
          ),
        ]
    );
  }
}

