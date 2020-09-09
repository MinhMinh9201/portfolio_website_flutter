import 'package:moor/moor_web.dart';
import 'package:moor/moor.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'database.dart';

part 'app_database.g.dart';

@UseMoor(
    tables: [Blogs, Projects, Profiles],
    daos: [BlogDao, ProjectDao, ProfileDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(WebDatabase('db'));

  static AppDatabase _instance;

  static AppDatabase instance() {
    if (_instance == null) {
      _instance = AppDatabase();
    }
    return _instance;
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(beforeOpen: (OpeningDetails details) async {
      await into(profiles).insert(Profile(
          id: AppDefautls.uid,
          name: AppDefautls.name,
          email: AppDefautls.email,
          description: AppStrings.description,
          urls: AppDefautls.urls,
          isDefault: 1,
          image: "",
          createTime: DateTime.now()));
      AppDefautls.blogs.forEach((element) async {
        await into(blogs).insert(element);
      });
      AppDefautls.projects.forEach((element) async {
        await into(projects).insert(element);
      });
    });
  }
}
