import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/profile/bloc/bloc.dart';
import 'package:portfolio_website/presentation/widgets/widgets.dart';
import 'package:portfolio_website/utils/utils.dart';

import 'bloc/bloc.dart';

class WidgetDescriptionAbout extends StatelessWidget {
  final bool editing;
  final TextEditingController controller;
  final String description;
  final bool isLarge;
  const WidgetDescriptionAbout(
      {this.controller, this.editing, this.isLarge, this.description});
  @override
  Widget build(BuildContext context) {
    return editing
        ? WidgetInput(
            height: 80,
            paddingLeftMore: 20,
            paddingHorizontal: 15,
            inputController: controller,
            width: isLarge ? 480 : 320,
            radiusBorder: 16,
            maxLines: 3,
            textAlign: TextAlign.center,
            endIcon: IconButton(
              icon: Icon(
                MaterialCommunityIcons.check,
                color: controller.text.trim().length != 0
                    ? AppColors.black
                    : AppColors.grey,
              ),
              onPressed: () {
                BlocProvider.of<AboutBloc>(context).add(EditAbout(
                    description: controller.text.trim().length != 0
                        ? controller.text.trim()
                        : null,
                    profileBloc: BlocProvider.of<ProfileBloc>(context)));
              },
            ),
            hint: description ??
                AppLocalizations.of(context)
                    .translate('about.hint_description'),
          )
        : Text(
            AppUtils.parseDescription(description),
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
            textScaleFactor: isLarge ? 1.5 : 1.25,
          );
  }
}
