import 'dart:convert';

import 'package:devfolio/blocs/code_bloc/code_event.dart';
import 'package:devfolio/blocs/code_bloc/code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../models/code_model.dart';

class CodeBloc extends Bloc<CodeEvent, CodeState> {
  CodeBloc() : super(const CodeInitialState()) {
    on<FetchCodeEvent>(_fetchCode);
  }

  Future<void> _fetchCode(FetchCodeEvent event, Emitter<CodeState> emit) async {
    emit(const CodeLoadingState());

    try {
      final langRes = await http.get(Uri.parse(
        'https://wakatime.com/share/@lonely_programmer/0109f169-6090-45bc-b373-e640dc48aeea.json',
      ));

      final generalRes = await http.get(Uri.parse(
        'https://wakatime.com/share/@lonely_programmer/4ca461c1-4f6f-4f90-84d8-bf1ef488e5e8.json',
      ));

      if (langRes.statusCode == 200 && generalRes.statusCode == 200) {
        final langDecoded = json.decode(langRes.body);
        final generalDecoded = json.decode(generalRes.body);

        // Extract language stats
        final langData = langDecoded['data'] as List<dynamic>;
        langData.sort((a, b) => b['percent'].compareTo(a['percent']));
        final topLanguages = langData.take(5).map((entry) {
          return LanguageStatsModel(
            entry['name'],
            (entry['percent'] as num).toInt(),
          );
        }).toList();

        // Extract general stats
        final data = generalDecoded['data'];
        final generalStats = [
          GeneralStatsModel(
            'My Best Coding Time',
            data['best_day']?['text'] ?? 'N/A',
          ),
          GeneralStatsModel(
            'My Daily Average Coding Time',
            data['grand_total']?['human_readable_daily_average'] ?? 'N/A',
          ),
          GeneralStatsModel(
            'My Total Coding Time',
            data['grand_total']?['human_readable_total'] ?? 'N/A',
          ),
          GeneralStatsModel(
            'My Total Coding Days',
            "${data['range']?['days_including_holidays'] ?? '0'} days",
          ),
        ];

        emit(CodeCombinedLoadedState(
          languageStats: topLanguages,
          generalStats: generalStats,
        ));
      } else {
        throw Exception('Failed to fetch one or both endpoints');
      }
    } catch (e) {
      emit(CodeErrorState(message: e.toString()));
    }
  }
}
