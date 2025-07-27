import 'package:devfolio/models/code_model.dart';

abstract class CodeState {
  const CodeState();
}

class CodeInitialState extends CodeState {
  const CodeInitialState();
}

class CodeLoadingState extends CodeState {
  const CodeLoadingState();
}

class CodeCombinedLoadedState extends CodeState {
  final List<LanguageStatsModel> languageStats;
  final List<GeneralStatsModel> generalStats;

  const CodeCombinedLoadedState({
    required this.languageStats,
    required this.generalStats,
  });
}

class CodeErrorState extends CodeState {
  final String message;

  const CodeErrorState({required this.message});
}