import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/resource/database/database.dart';
import 'package:portfolio_website/utils/app_utils.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;

class ProfileRepository {
  final ProfileDao dao;
  final fs.DocumentReference ref;
  ProfileRepository({this.dao})
      : ref = fb.firestore().collection('database').doc('profiles');

  Future<Profile> getProfileDao() => dao.getProfile();

  Future insertDao(Profile profile) => dao.insertProfile(profile);

  Future updateDao(Profile profile) => dao.updateProfile(profile);

  Future deleteDao(Profile profile) => dao.deleteProfile(profile);

  //Firebase
  Future<List<Profile>> getAll({String username}) async {
    try {
      final col = ref.collection(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      final query = await col.get();
      final profiles = query.docs
          .map((e) => Profile.fromJson(AppUtils.parseData(e.data())))
          .toList();
      return profiles;
    } catch (e) {
      return [];
    }
  }

  Future<Profile> get({String username}) async {
    try {
      List<Profile> data = await this.getAll(username: username);
      if (data != null && data.length != 0) {
        return data.firstWhere((element) => element.isDefault == 1) ??
            data.first;
      } else
        return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> insert({String username, Profile profile}) async {
    try {
      final col = ref.collection(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      await col.add(AppUtils.mapData(profile?.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update({String id, String username, Profile profile}) async {
    try {
      final col = ref.collection(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      await col.doc(id).set((AppUtils.mapData(profile?.toJson())));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete({String id, String username}) async {
    try {
      final col = ref.collection(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      await col.doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
