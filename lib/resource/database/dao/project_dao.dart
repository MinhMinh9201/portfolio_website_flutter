import 'package:moor/moor_web.dart';

import '../database.dart';

part 'project_dao.g.dart';

@UseDao(tables: [Projects])
class ProjectDao extends DatabaseAccessor<AppDatabase> with _$ProjectDaoMixin {
  final AppDatabase db;

  ProjectDao(this.db) : super(db);

  Future<List<Project>> getAll() => (select(projects)
        ..orderBy([
          (e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.desc)
        ]))
      .get();

  Future insertProject(Project project) =>
      into(projects).insert(project, orReplace: true);

  Future updateProject(Project project) => update(projects).replace(project);

  Future deleteProject(Project project) => delete(projects).delete(project);
}
