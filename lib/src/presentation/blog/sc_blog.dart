import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/blog/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/blog/editer/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/blog/editer/widget_blog_editer.dart';
import 'package:portfolio_website/src/presentation/blog/widget_blog.dart';
import 'package:portfolio_website/src/presentation/profile/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_error_state.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_response.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';
import 'dart:html' as Html;

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  String username;
  ProfileLoaded stateProfile;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      String routeName = ModalRoute.of(context).settings.name;
      username = routeName.substring(routeName.indexOf('@'));
      stateProfile = BlocProvider.of<ProfileBloc>(context).state;
      BlocProvider.of<BlogBloc>(context).add(LoadBlog(
          username: username, isCanEdit: stateProfile?.isCanEdit ?? false));
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
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        if (profileState is ProfileLoaded) {
          if (!profileState.isEditing)
            BlocProvider.of<BlogEditerBloc>(context).add(HideBlogEditer());
          return Scaffold(
            body: BlocBuilder<BlogEditerBloc, BlogEditerState>(
              builder: (context, editerState) {
                bool editing = editerState is BlogEditerLoaded ||
                    editerState is BlogEditerLoading;
                EdgeInsets padding = EdgeInsets.only(
                    right: editing
                        ? (WidgetResponse.isLargeScreen(context) ? 500 : 350)
                        : 0);
                return WidgetResponse(
                  large: Stack(
                    children: [
                      Center(
                          child: Padding(
                        padding: padding,
                        child: FractionallySizedBox(
                          widthFactor: editing ? 0.65 : 0.5,
                          child: _buildBlogs(
                              state.content, profileState.isEditing),
                        ),
                      )),
                      Positioned(
                        child: WidgetBlogEditer(username: username),
                        top: 0,
                        right: 0,
                      )
                    ],
                  ),
                  medium: Stack(
                    children: [
                      Center(
                          child: Padding(
                        padding: padding,
                        child: FractionallySizedBox(
                          widthFactor: editing ? 0.8 : 0.65,
                          child: _buildBlogs(
                              state.content, profileState.isEditing),
                        ),
                      )),
                      Positioned(
                        child: WidgetBlogEditer(username: username),
                        top: 0,
                        right: 0,
                      )
                    ],
                  ),
                  small: Center(
                      child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: _buildBlogs(state.content, profileState.isEditing),
                  )),
                );
              },
            ),
          );
        } else
          return Container();
      },
    );
  }

  FloatingActionButton _buildAddAction() {
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: () {},
      elevation: 6,
      child: Icon(Icons.add),
    );
  }

  Widget _buildBlogs(List<Blog> blogs, bool isEditing) {
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
                        if (isEditing ?? false) {
                          BlocProvider.of<BlogEditerBloc>(context)
                              .add(LoadBlogEditer(blog: blogs[index]));
                        } else {
                          Html.window
                              .open(blogs[index].url, "${blogs[index].title}");
                        }
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
