
abstract class ProjectEvent {
  const ProjectEvent();
}

class FetchProjectsEvent extends ProjectEvent {}

class RefreshProjectsEvent extends ProjectEvent {}

class LoadMoreProjectsEvent extends ProjectEvent {}