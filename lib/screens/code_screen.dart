import 'package:collection/collection.dart';
import 'package:devfolio/blocs/code_bloc/code_bloc.dart';
import 'package:devfolio/blocs/code_bloc/code_event.dart';
import 'package:devfolio/blocs/code_bloc/code_state.dart';
import 'package:devfolio/config/text_theme.dart';
import 'package:devfolio/models/code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:devfolio/components/Responsive.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenPcState();
}

class _CodeScreenPcState extends State<CodeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CodeBloc>().add(FetchCodeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CodeBloc, CodeState>(
        builder: (context, state) {
          if (state is CodeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CodeErrorState) {
            return Center(
                child: Text(state.message,
                    style: MyTextTheme.headline.copyWith(color: Colors.black)));
          } else if (state is CodeCombinedLoadedState) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Responsive.isMobile(context)
                        ? CarouselSlider(
                      options: CarouselOptions(
                        height: 600,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                      ),
                      items: [
                        _buildLanguagePieChart(state),
                        _buildCodeDaysGraph(),
                        _buildCodeDetails(state),
                        _buildWakaTimeLogo(),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLanguagePieChart(state),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCodeDaysGraph(),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                _buildCodeDetails(state),
                                const SizedBox(width: 20),
                                _buildWakaTimeLogo(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        "*THE ABOVE GIVEN DETAILS ARE LIVE AND PROVIDED BY WAKATIME*",
                        textAlign: TextAlign.center,
                        style: MyTextTheme.headline.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
                child: Text("Initializing...",
                    style: TextStyle(color: Colors.black)));
          }
        },
      ),
    );
  }

  Widget _buildLanguagePieChart(CodeCombinedLoadedState state) {
    return Container(
      height: 420,
      width: 400,
      margin: const EdgeInsets.all(8),
      decoration: _decoratedBoxStyle(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Languages.Me",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Expanded(child: PieChartWidget(data: state.languageStats)),
        ],
      ),
    );
  }

  Widget _buildCodeDaysGraph() {
    return Container(
      height: 200,
      width: 800,
      margin: const EdgeInsets.all(8),
      decoration: _decoratedBoxStyle(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "CodeDays.Me",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Expanded(
              child: SvgPicture.network(
                "https://wakatime.com/share/@lonely_programmer/3b9be064-3e5b-4440-9ca2-630610ee613a.svg",
                placeholderBuilder: (_) => const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeDetails(CodeCombinedLoadedState state) {
    return Container(
      height: 200,
      width: 500,
      margin: const EdgeInsets.all(8),
      decoration: _decoratedBoxStyle(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CodeDetails(data: state.generalStats),
      ),
    );
  }

  Widget _buildWakaTimeLogo() {
    return Container(
      height: 200,
      width: 280,
      margin: const EdgeInsets.all(8),
      decoration: _decoratedBoxStyle(),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/wakatime.png"),
              height: 100,
              width: 100,
            ),
            SizedBox(height: 10),
            OpenLinkButton(url: "https://wakatime.com/@lonely_programmer"),
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoratedBoxStyle() {
    return BoxDecoration(
      color: Colors.lightGreen.shade200,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.grey.shade300),
    );
  }
}

class PieChartWidget extends StatefulWidget {
  final List<LanguageStatsModel> data;

  const PieChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool _animationCompleted = false;
  int _touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        return PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (event, response) {
                final touched =
                    response?.touchedSection?.touchedSectionIndex ?? -1;
                if (touched != _touchedIndex) {
                  setState(() => _touchedIndex = touched);
                }
              },
            ),
            borderData: FlBorderData(show: false),
            sectionsSpace: 2,
            centerSpaceRadius: 30,
            sections:
                _buildSections(_animationCompleted ? 1.0 : _animation.value),
          ),
        );
      },
    );
  }

  List<PieChartSectionData> _buildSections(double animValue) {
    return widget.data.mapIndexed((i, lang) {
      final isTouched = i == _touchedIndex;
      return PieChartSectionData(
        color: Colors.primaries[i % Colors.primaries.length],
        value: lang.percent.toDouble() * animValue,
        radius: isTouched ? 80 : 70,
        title: isTouched ? lang.language : '',
        titleStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        badgeWidget:
            _Badge(lang.language.toLowerCase(), size: isTouched ? 45 : 35),
        badgePositionPercentageOffset: 0.98,
      );
    }).toList();
  }
}

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;

  const _Badge(this.svgAsset, {required this.size});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * 0.15),
      child: Center(
        child: SvgPicture.network(
          "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/$svgAsset/$svgAsset-original.svg",
          placeholderBuilder: (_) => const SizedBox.shrink(),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class CodeDetails extends StatelessWidget {
  final List<GeneralStatsModel> data;

  const CodeDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data.map((stat) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Text('${stat.name}: ${stat.value}',
              style: MyTextTheme.headline
                  .copyWith(color: Colors.black, fontSize: 20)),
        );
      }).toList(),
    );
  }
}

class OpenLinkButton extends StatelessWidget {
  final String url;

  const OpenLinkButton({super.key, required this.url});

  Future<void> _launchURL() async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchURL,
      child: Text('View My Profile', style: MyTextTheme.headline),
    );
  }
}
