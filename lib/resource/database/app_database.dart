import 'package:moor/moor_web.dart';
import 'package:moor/moor.dart';
import 'database.dart';

part 'app_database.g.dart';

@UseMoor(tables: [Blogs, Projects], daos: [BlogDao, ProjectDao])
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
}
