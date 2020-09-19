import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/resource/database/database.dart';
import 'package:portfolio_website/src/utils/app_utils.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;

class ProfileRepository {
  final ProfileDao dao;
  final fs.CollectionReference ref;
  ProfileRepository({this.dao}) : ref = fb.firestore().collection('users');

  Future<Profile> getProfileDao() => dao.getProfile();

  Future insertDao(Profile profile) => dao.insertProfile(profile);

  Future updateDao(Profile profile) => dao.updateProfile(profile);

  Future deleteDao(Profile profile) => dao.deleteProfile(profile);

  //Firebase
  Future<Profile> get({String username}) async {
    String name =
        username ?? AppUtils.emailToUsername(email: AppDefautls.email);
    try {
      final col = ref.doc('$name');
      final profile = await col.get();
      return Profile.fromJson(AppUtils.parseData(profile.data()));
    } catch (e) {
      return null;
    }
  }

  Future<bool> insertOrReplace({String username, Profile profile}) async {
    String name =
        username ?? AppUtils.emailToUsername(email: AppDefautls.email);
    try {
      final col = ref.doc(name);
      await col.set(AppUtils.mapData(profile?.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete({String id, String username}) async {
    try {
      final col = ref.doc(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      await col.delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
