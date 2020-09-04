import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/presentation/blog/bloc/bloc.dart';
import 'package:portfolio_website/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/presentation/widgets/widget_error_state.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      BlocProvider.of<BlogBloc>(context).add(LoadBlog());
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
        child: Center(
          child: Text(state.content),
        ),
      ),
    );
  }
}
