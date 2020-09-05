import 'package:portfolio_website/resource/database/database.dart';

class ProjectRepository {
  final ProjectDao dao;
  const ProjectRepository({this.dao});

  Future<List<Project>> getAll() => dao.getAll();

  Future insertProject(Project project) => dao.insertProject(project);

  Future updateProject(Project project) => dao.updateProject(project);

  Future deleteProject(Project project) => dao.deleteProject(project);
}
