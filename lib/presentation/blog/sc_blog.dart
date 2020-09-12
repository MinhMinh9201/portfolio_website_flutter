import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/blog/bloc/bloc.dart';
import 'package:portfolio_website/presentation/blog/widget_blog.dart';
import 'package:portfolio_website/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/presentation/widgets/widget_error_state.dart';
import 'package:portfolio_website/presentation/widgets/widget_response.dart';
import 'package:portfolio_website/resource/database/app_database.dart';
import 'dart:html' as Html;

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  String username;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      String routeName = ModalRoute.of(context).settings.name;
      username = routeName.substring(routeName.indexOf('@'));
      BlocProvider.of<BlogBloc>(context).add(LoadBlog(username: username));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(builder: (context, state) {
      if (state is BlogLoading) {
        return Center(
          child: WidgetCircleProgress(),
        );
      } else if (state is BlogLoaded) {
        return _buildContent(state);
      } else if (state is BlogWithError) {
        return WidgetErrorState(
          refresh: () async {
            BlocProvider.of<BlogBloc>(context).add(LoadBlog());
          },
        );
      } else {
        return WidgetErrorState(
          refresh: () async {
            BlocProvider.of<BlogBloc>(context).add(LoadBlog());
          },
          message: "Unknow state",
        );
      }
    });
  }

  Widget _buildContent(BlogLoaded state) {
    return Scaffold(
      body: Container(
        child: WidgetResponse(
          large: Center(
              child: FractionallySizedBox(
            widthFactor: 0.5,
            child: _buildBlogs(state.content),
          )),
          medium: Center(
              child: FractionallySizedBox(
            widthFactor: 0.65,
            child: _buildBlogs(state.content),
          )),
          small: Center(
              child: FractionallySizedBox(
            widthFactor: 0.85,
            child: _buildBlogs(state.content),
          )),
        ),
      ),
    );
  }

  Widget _buildBlogs(List<Blog> blogs) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
                itemCount: blogs.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => WidgetBlog(
                      blog: blogs[index],
                      isTop: index == 0,
                      isBottom: blogs.length - 1 == index,
                      action: () {
                        Html.window
                            .open(blogs[index].url, "${blogs[index].title}");
                      },
                    )),
            RaisedButton(
              child: Text(
                'More',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.white),
              ),
              elevation: 0.0,
              onPressed: () => Html.window.open(AppValues.URL_MEDIUM, username),
            )
          ],
        ),
      ),
    );
  }
}
