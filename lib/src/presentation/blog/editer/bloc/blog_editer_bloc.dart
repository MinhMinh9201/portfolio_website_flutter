import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/presentation/blog/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/blog/editer/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/resource.dart';

class BlogEditerBloc extends Bloc<BlogEditerEvent, BlogEditerState> {
  BlogEditerBloc() : super(BlogEditerHiding());

  @override
  Stream<BlogEditerState> mapEventToState(BlogEditerEvent event) async* {
    if (event is LoadBlogEditer) {
      yield* _loadToState(event.blog);
    } else if (event is HideBlogEditer) {
      yield* _hideToState();
    } else if (event is SaveBlogEditer) {
      yield* _saveToState(event.blog, event.bloc, event.username);
    }
  }

  Stream<BlogEditerState> _saveToState(
      Blog blog, BlogBloc bloc, String username) async* {
    bloc.add(UpdateBlog(blog: blog, username: username, bloc: this));
  }

  Stream<BlogEditerState> _loadToState(Blog blog) async* {
    yield BlogEditerLoading();
    await Future.delayed(Duration(seconds: 1));
    yield BlogEditerLoaded(blog: blog);
  }

  Stream<BlogEditerState> _hideToState() async* {
    yield BlogEditerHiding();
  }
}
