class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  List<String> technologies = [];
  final String projectUrl;

  ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.technologies = const [],
    required this.projectUrl,
  });
}