import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/resource/database/database.dart';
import 'package:portfolio_website/utils/app_utils.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;

class BlogRepository {
  final BlogDao dao;
  final fs.DocumentReference ref;
  BlogRepository({this.dao})
      : ref = fb.firestore().collection('database').doc('blogs');

  Future<List<Blog>> getAllDao() => dao.getAll();

  Future insertDao(Blog blog) => dao.insertBlog(blog);

  Future updateDao(Blog blog) => dao.updateBlog(blog);

  Future deleteDao(Blog blog) => dao.deleteBlog(blog);

  //Firebase
  Future<List<Blog>> getAll({String username}) async {
    try {
      final col = ref.collection(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      final query = await col.get();
      final blogs = query.docs
          .map((e) => Blog.fromJson(AppUtils.parseData(e.data())))
          .toList();
      return blogs;
    } catch (e) {
      return [];
    }
  }

  Future<bool> insert({String username, Blog blog}) async {
    try {
      final col = ref.collection(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      await col.add(AppUtils.mapData(blog?.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update({String id, String username, Blog blog}) async {
    try {
      final col = ref.collection(
          '${username ?? AppUtils.emailToUsername(email: AppDefautls.email)}');
      await col.doc(id).set((AppUtils.mapData(blog?.toJson())));
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
