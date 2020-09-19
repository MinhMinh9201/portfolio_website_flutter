import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/resource/database/database.dart';
import 'package:portfolio_website/src/utils/app_utils.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;

class ProjectRepository {
  final ProjectDao dao;
  final fs.DocumentReference ref;
  ProjectRepository({this.dao})
      : ref = fb.firestore().collection('database').doc('projects');

  Future<List<Project>> getAllDao() => dao.getAll();

  Future insertProject(Project project) => dao.insertProject(project);

  Future updateProject(Project project) => dao.updateProject(project);

  Future deleteProject(Project project) => dao.deleteProject(project);

  //Firebase
  Future<List<Project>> getAll({String username}) async {
    try {
      final col = ref.collection(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      final query = await col.get();
      final projects = query.docs
          .map((e) => Project.fromJson(AppUtils.parseData(e.data())))
          .toList();
      return projects;
    } catch (e) {
      return [];
    }
  }

  Future<bool> insert({String username, Project project}) async {
    try {
      final col = ref.collection(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      await col.add(AppUtils.mapData(project?.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update({String id, String username, Project project}) async {
    try {
      final col = ref.collection(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      await col.doc(id).set((AppUtils.mapData(project?.toJson())));
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
