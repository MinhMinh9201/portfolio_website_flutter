import 'package:moor/moor.dart';
import '../database.dart';

part 'profile_dao.g.dart';

@UseDao(tables: [Profiles])
class ProfileDao extends DatabaseAccessor<AppDatabase> with _$ProfileDaoMixin {
  final AppDatabase db;

  ProfileDao(this.db) : super(db);

  Future<Profile> getProfile({String id, bool isDefault = false}) async {
    return await (select(profiles)
          ..where((tbl) => tbl.isDefault.isIn([(isDefault ? 1 : 0)]))
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future insertProfile(Profile profile) =>
      into(profiles).insert(profile, mode: InsertMode.insertOrReplace);

  Future updateProfile(Profile profile) => update(profiles).replace(profile);

  Future deleteProfile(Profile profile) => delete(profiles).delete(profile);
}
