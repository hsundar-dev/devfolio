import 'package:devfolio/components/Responsive.dart';
import 'package:devfolio/components/constants.dart';
import 'package:devfolio/components/typing_animation_banner.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import '../../../components/animated_texts_componenets.dart';
import '../../../components/combine_subtitle.dart';
import 'description_text.dart';
import 'download_button.dart';
import 'headline_text.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    bool isDesktop = Responsive.isDesktop(context);

    // MOBILE / TABLET LAYOUT
    Widget mobileLayout() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Remove unnecessary top spacing
          const SizedBox(height: 8),

          // Centered image at top
          Center(
            child: AnimatedImageContainer(width: 165, height: 215),
          ),

          const SizedBox(height: 20),

          // Adjusted headline font sizes
          const Responsive(
            desktop: MyPortfolioText(start: 44, end: 56),
            largeMobile: MyPortfolioText(start: 44, end: 40),
            mobile: MyPortfolioText(start: 38, end: 34),
            tablet: MyPortfolioText(start: 54, end: 44),
          ),

          if (kIsWeb && Responsive.isLargeMobile(context))
            const SizedBox(height: defaultPadding),

          const TypingAnimationBanner(),
          const SizedBox(height: defaultPadding / 2),

          // Adjusted description font sizes
          const Responsive(
            desktop: AnimatedDescriptionText(start: 18, end: 19),
            largeMobile: AnimatedDescriptionText(start: 16, end: 14),
            mobile: AnimatedDescriptionText(start: 15, end: 14),
            tablet: AnimatedDescriptionText(start: 20, end: 18),
          ),
        ],
      );
    }

    // DESKTOP LAYOUT
    Widget desktopLayout() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Responsive(
                    desktop: MyPortfolioText(start: 44, end: 56),
                    largeMobile: MyPortfolioText(start: 44, end: 40),
                    mobile: MyPortfolioText(start: 38, end: 34),
                    tablet: MyPortfolioText(start: 54, end: 44),
                  ),
                  if (kIsWeb && Responsive.isLargeMobile(context))
                    Container(height: defaultPadding, color: Colors.transparent),
                  const TypingAnimationBanner(),
                  const SizedBox(height: defaultPadding / 2),
                  const Responsive(
                    desktop: AnimatedDescriptionText(start: 18, end: 19),
                    largeMobile: AnimatedDescriptionText(start: 16, end: 14),
                    mobile: AnimatedDescriptionText(start: 15, end: 14),
                    tablet: AnimatedDescriptionText(start: 20, end: 18),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Center(child: AnimatedImageContainer()),
          ),
        ],
      );
    }

    return isDesktop ? desktopLayout() : mobileLayout();
  }
}
