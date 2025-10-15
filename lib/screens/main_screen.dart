import 'package:carousel_slider/carousel_slider.dart';
import 'package:devfolio/components/Responsive.dart';
import 'package:devfolio/components/responsive_navbar.dart';
import 'package:devfolio/config/text_theme.dart';
import 'package:devfolio/screens/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';
import 'code_screen.dart';
import 'home_screen.dart';

class MainScreenPc extends StatefulWidget {
  const MainScreenPc({super.key});

  @override
  State<MainScreenPc> createState() => _MainScreenPcState();
}

class _MainScreenPcState extends State<MainScreenPc> {
  final ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  int currentIndex = 0;

  static const List<String> sections = ['Home', 'Code', 'Projects'];
  static const List<String> carouselItems = [
    'android_studio.png',
    'c.png',
    'canva.png',
    'css.png',
    'figma.png',
    'flutter.png',
    'google_cloud.png',
    'html.png',
    'java.png',
    'mongodb.png',
    'php.png',
    'python.png',
    'vscode.png',
  ];

  void scrollToSection(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _itemPositionsListener.itemPositions.addListener(() {
      final positions = _itemPositionsListener.itemPositions.value;
      if (positions.isNotEmpty) {
        // Get the item most visible from top
        final firstVisible = positions
            .where((pos) => pos.itemLeadingEdge >= 0)
            .reduce((min, pos) =>
        pos.itemLeadingEdge < min.itemLeadingEdge ? pos : min);

        if (firstVisible.index != currentIndex) {
          setState(() {
            currentIndex = firstVisible.index;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Responsive.isMobile(context) ? _buildDrawer() : null,
      body: Column(
        children: [
          ResponsiveNavBar(
            navItems: sections,
            scrollToSection: scrollToSection,
            currentIndex: currentIndex,
          ),
          Expanded(
            child: ScrollablePositionedList.builder(
              itemCount: sections.length,
              itemScrollController: _scrollController,
              itemPositionsListener: _itemPositionsListener,
              itemBuilder: (context, index) {
                return _getSectionWidget(index, screenHeight);
              },
            )
          ),
        ],
      ),
    );
  }


  Drawer _buildDrawer() {
    return Drawer(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 24),
        itemCount: sections.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) => ListTile(
          title: Text(
            sections[index],
            style: const TextStyle(fontSize: 18),
          ),
          selected: currentIndex == index,
          onTap: () {
            Navigator.pop(context);
            scrollToSection(index);
          },
        ),
      ),
    );
  }

  Widget _getSectionWidget(int index, double height) {
    switch (index) {
      case 0:
        return _sectionContainer(
          height: height * 0.9,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              const Center(child: HomeScreen()),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(child: _bottomCarouselSlider()),
              ),
            ],
          ),
        );
      case 1:
        return _sectionContainer(
          height: height,
          color: Colors.grey[200],
          child: const CodeScreen(),
        );
      case 2:
        return _sectionContainer(
          height: height,
          color: Colors.white,
          child: const ProjectsScreen()
        );
      default:
        return const SizedBox();
    }
  }

  Widget _sectionContainer({
    required double height,
    Color? color,
    BoxDecoration? decoration,
    required Widget child,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      color: color,
      decoration: decoration,
      alignment: Alignment.center,
      child: child,
    );
  }

  Widget _bottomCarouselSlider() {
    return SizedBox(
      height: 18.h,
      child: CarouselSlider.builder(
        itemCount: carouselItems.length,
        options: CarouselOptions(
          height: 18.h,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayInterval: const Duration(seconds: 2),
          enlargeCenterPage: true,
          viewportFraction: 0.2,
        ),
        itemBuilder: (context, index, realIdx) {
          final imageName = carouselItems[index];
          final label = imageName
              .replaceAll('.png', '')
              .replaceAll('_', ' ')
              .toUpperCase();

          final isMobile = Responsive.isMobile(context);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.w),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2.w),
                    child: Image.asset(
                      'assets/logos/$imageName',
                      fit: BoxFit.contain,
                      width: 8.h,
                      height: 8.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 2 : 8), // reduced padding on mobile
              Text(
                label,
                textAlign: TextAlign.center,
                style: MyTextTheme.body.copyWith(fontSize: 11.sp),
              ),
            ],
          );
        },
      ),
    );
  }
}
