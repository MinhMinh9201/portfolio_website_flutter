import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';

class WidgetBlog extends StatelessWidget {
  final Blog blog;
  final Function action;
  final bool isTop;
  final bool isBottom;

  const WidgetBlog(
      {@required this.blog,
      this.action,
      this.isTop = false,
      this.isBottom = false});

  @override
  Widget build(BuildContext context) {
    double topPadding = isTop ? 16 : 8.0;
    double bottomPadding = isBottom ? 16 : 8.0;
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, topPadding, 16.0, bottomPadding),
      child: InkWell(
        onTap: action,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: blog.image,
                placeholder: (context, url) => Container(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: WidgetCircleProgress(),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                blog.title,
                style: Theme.of(context).textTheme.title,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(blog.description,
                  style: Theme.of(context).textTheme.subtitle),
            ],
          ),
        ),
      ),
    );
  }
}
