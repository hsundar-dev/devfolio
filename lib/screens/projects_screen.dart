import 'package:carousel_slider/carousel_slider.dart';
import 'package:devfolio/blocs/project_bloc/project_bloc.dart';
import 'package:devfolio/blocs/project_bloc/project_event.dart';
import 'package:devfolio/blocs/project_bloc/project_state.dart';
import 'package:devfolio/components/projects_card.java.dart';
import 'package:devfolio/models/projects_model.dart';
import 'package:devfolio/services/project_repositiory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProjectBloc>(context).add(FetchProjectsEvent());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      decoration: BoxDecoration(color: Colors.lightGreen.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 30),

          Expanded(
            child: Center(
              child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  if (state is ProjectLoadingState) {
                    return const CircularProgressIndicator();
                  }

                  if (state is ProjectLoadedState) {
                    List<ProjectModel> projectsList = state.projects;
                    return CarouselSlider.builder(
                      itemCount: projectsList.length,
                      itemBuilder: (context, index, realIdx) {
                        return Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 380, // card width
                              maxHeight: 400, // card height
                            ),
                            child: ProjectCard(project: projectsList[index]),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 500,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        viewportFraction:
                        width > 900 ? 0.33 : (width > 600 ? 0.6 : 0.85),
                        autoPlay: false,
                        aspectRatio: 3 / 2,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      ),
                    );
                  }
                  else if (state is ProjectErrorState) {
                    return Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  else {
                    return const Text('No projects available');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
