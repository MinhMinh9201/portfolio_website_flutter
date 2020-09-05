import 'package:portfolio_website/resource/database/database.dart';

class BlogRepository {
  final BlogDao dao;
  const BlogRepository({this.dao});

  Future<List<Blog>> getAll() => dao.getAll();

  Future insertBlog(Blog blog) => dao.insertBlog(blog);

  Future updateBlog(Blog blog) => dao.updateBlog(blog);

  Future deleteBlog(Blog blog) => dao.deleteBlog(blog);
}
