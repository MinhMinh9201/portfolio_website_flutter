import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';

class WidgetProject extends StatelessWidget {
  final Project project;
  final Function action;
  final bool isTop;
  final bool isBottom;

  const WidgetProject(
      {@required this.project,
      this.action,
      this.isTop = false,
      this.isBottom = false});
  @override
  Widget build(BuildContext context) {
    double height = 80;
    double topPadding = isTop ? 16 : 8.0;
    double bottomPadding = isBottom ? 16 : 8.0;
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, bottomPadding),
      child: InkWell(
        onTap: action,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Card(
                  child: CachedNetworkImage(
                    imageUrl: project.image,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Container(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: WidgetCircleProgress(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(project.name,
                          style: Theme.of(context).textTheme.title),
                      const SizedBox(height: 4),
                      Text(
                        project.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: 1.2,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
