import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/presentation/projects/bloc/bloc.dart';
import 'package:portfolio_website/presentation/projects/widget_project.dart';
import 'package:portfolio_website/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/presentation/widgets/widget_error_state.dart';
import 'package:portfolio_website/presentation/widgets/widget_response.dart';
import 'package:portfolio_website/resource/database/app_database.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      String routeName = ModalRoute.of(context).settings.name;
      String username = routeName.substring(routeName.indexOf('@'));
      BlocProvider.of<ProjectsBloc>(context)
          .add(LoadProjects(username: username));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        if (state is ProjectsLoading) {
          return Center(
            child: WidgetCircleProgress(),
          );
        } else if (state is ProjectsLoaded) {
          return _buildContent(state);
        } else if (state is ProjectsWithError) {
          return WidgetErrorState(
            refresh: () async {
              BlocProvider.of<ProjectsBloc>(context).add(LoadProjects());
            },
          );
        } else {
          return WidgetErrorState(
            refresh: () async {
              BlocProvider.of<ProjectsBloc>(context).add(LoadProjects());
            },
            message: "Unknow state",
          );
        }
      },
    );
  }

  Widget _buildContent(ProjectsLoaded state) {
    return Scaffold(
      body: Container(
        child: _buildProjects(state.projects),
      ),
    );
  }

  Widget _buildProjects(List<Project> projects) {
    return WidgetResponse(
      large: GridView.count(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
        crossAxisCount: 3,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.3),
        children: List.generate(
            projects.length,
            (index) => WidgetProject(
                  project: projects[index],
                )),
      ),
      medium: GridView.count(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.3),
        children: List.generate(
            projects.length,
            (index) => WidgetProject(
                  project: projects[index],
                )),
      ),
      small: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: projects.length,
          itemBuilder: (context, index) => WidgetProject(
                project: projects[index],
                isBottom: index == projects.length - 1,
                isTop: index == 0,
              )),
    );
  }
}
