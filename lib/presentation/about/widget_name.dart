import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/profile/bloc/bloc.dart';
import 'package:portfolio_website/presentation/widgets/widgets.dart';

import 'bloc/bloc.dart';

class WidgetNameAbout extends StatelessWidget {
  final bool editing;
  final TextEditingController controller;
  final String name;
  final bool isLarge;
  const WidgetNameAbout(
      {this.controller, this.editing, this.isLarge, this.name});
  @override
  Widget build(BuildContext context) {
    return editing
        ? WidgetInput(
            height: 60,
            paddingHorizontal: 15,
            inputController: controller,
            width: isLarge ? 350 : 280,
            radiusBorder: 16,
            paddingLeftMore: 12,
            textAlign: TextAlign.center,
            style: AppStyles.DEFAULT_LARGE,
            endIcon: IconButton(
              icon: Icon(MaterialCommunityIcons.check,
                  color: controller.text.trim().length != 0
                      ? AppColors.black
                      : AppColors.grey),
              onPressed: () {
                BlocProvider.of<AboutBloc>(context).add(EditAbout(
                    name: controller.text.trim().length != 0
                        ? controller.text.trim()
                        : null,
                    profileBloc: BlocProvider.of<ProfileBloc>(context)));
              },
            ),
            hint: name ??
                AppLocalizations.of(context).translate('about.hint_name'),
          )
        : Text(
            name ?? "",
            textScaleFactor: isLarge ? 3.5 : 3.0,
          );
  }
}
