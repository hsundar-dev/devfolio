import 'package:devfolio/models/projects_model.dart';

abstract class ProjectState {
  const ProjectState();
}

class ProjectInitialState extends ProjectState {
  const ProjectInitialState();
}

class ProjectLoadingState extends ProjectState {
  const ProjectLoadingState();
}

class ProjectLoadedState extends ProjectState {
  final List<ProjectModel> projects;

  const ProjectLoadedState({required this.projects});
}

class ProjectErrorState extends ProjectState {
  final String message;

  const ProjectErrorState({required this.message});
}