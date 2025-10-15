import 'package:devfolio/blocs/project_bloc/project_event.dart';
import 'package:devfolio/blocs/project_bloc/project_state.dart';
import 'package:devfolio/services/project_repositiory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(const ProjectInitialState()) {
    on<FetchProjectsEvent>(_fetchProjects);
  }
    void _fetchProjects(FetchProjectsEvent event, Emitter<ProjectState> emit) async {
      emit(const ProjectLoadingState());
      try {
        // Simulate fetching projects from an API or database
        await Future.delayed(const Duration(seconds: 2));
        final projects = ProjectRepository.getProjects();
        emit(ProjectLoadedState(projects: projects));
      } catch (e) {
        emit(ProjectErrorState(message: e.toString()));
      }
    }
  }