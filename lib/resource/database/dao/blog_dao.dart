import 'package:moor/moor.dart';
import '../database.dart';

part 'blog_dao.g.dart';

@UseDao(tables: [Blogs])
class BlogDao extends DatabaseAccessor<AppDatabase> with _$BlogDaoMixin {
  final AppDatabase db;

  BlogDao(this.db) : super(db);

  Future<List<Blog>> getAll() => (select(blogs)
        ..orderBy([
          (e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.desc)
        ]))
      .get();

  Future insertBlog(Blog blog) =>
      into(blogs).insert(blog, mode: InsertMode.insertOrReplace);

  Future updateBlog(Blog blog) => update(blogs).replace(blog);

  Future deleteBlog(Blog blog) => delete(blogs).delete(blog);
}
