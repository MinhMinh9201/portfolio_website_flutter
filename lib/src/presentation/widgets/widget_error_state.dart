import 'package:flutter/material.dart';
import 'package:portfolio_website/src/configs/configs.dart';

class WidgetErrorState extends StatelessWidget {
  final Function refresh;
  final String message;
  const WidgetErrorState({this.refresh, this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Theme.of(context).primaryColorDark,
        backgroundColor: Theme.of(context).primaryColorLight,
        strokeWidth: 2.5,
        onRefresh: () async {
          await refresh();
          await Future.delayed(Duration(seconds: 1));
          return true;
        },
        child: Stack(
          children: [
            Center(
              child: Text(
                message ??
                    AppLocalizations.of(context).translate('app.message_error'),
                style: AppStyles.DEFAULT_SMALL_BOLD,
              ),
            ),
            ListView()
          ],
        ),
      ),
    );
  }
}
