import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/about/socials/widget_socials.dart';
import 'package:portfolio_website/src/presentation/profile/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_error_state.dart';
import 'dart:html' as Html;

import 'package:portfolio_website/src/presentation/widgets/widget_response.dart';
import 'package:portfolio_website/src/presentation/widgets/widgets.dart';
import 'package:portfolio_website/src/resource/resource.dart';
import 'package:portfolio_website/src/utils/utils.dart';

import 'bloc/bloc.dart';
import 'description/widget_description.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  ProfileLoaded stateProfile;
  String username;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      String routeName = ModalRoute.of(context).settings.name;
      username = routeName.substring(routeName.indexOf('@'));
      stateProfile = BlocProvider.of<ProfileBloc>(context).state;
      BlocProvider.of<AboutBloc>(context).add(LoadAbout(
          username: username, canEdit: stateProfile?.isCanEdit ?? false));
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state is ProfileLoaded && state.isEditing) {
        _nameController?.clear();
        _descriptionController?.clear();
      }
    }, child: BlocBuilder<AboutBloc, AboutState>(builder: (context, state) {
      if (state is AboutLoading) {
        return Center(
          child: WidgetCircleProgress(),
        );
      } else if (state is AboutLoaded) {
        return _buildContent(context: context, state: state);
      } else if (state is AboutWithError) {
        return WidgetErrorState(
          message: state.message,
          refresh: () async {
            BlocProvider.of<AboutBloc>(context).add(
                LoadAbout(username: username, canEdit: stateProfile.isCanEdit));
          },
        );
      } else if (state is AboutEditSuccess) {
        return WidgetErrorState(
          message: AppLocalizations.of(context).translate('app.success'),
        );
      } else if (state is AboutEditFailure) {
        return WidgetErrorState(
          message: AppLocalizations.of(context).translate('app.failure'),
        );
      } else {
        return WidgetErrorState(
          refresh: () async {
            BlocProvider.of<AboutBloc>(context).add(
                LoadAbout(username: username, canEdit: stateProfile.isCanEdit));
          },
          message: "Unknow state",
        );
      }
    }));
  }

  Widget _buildContent({BuildContext context, AboutLoaded state}) {
    final Profile profile = state?.profile;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded)
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: WidgetResponse(
                    large: Column(
                      children: [
                        _buildImage(
                            isLarge: true,
                            url: profile?.image,
                            editing: state.isEditing),
                        _buildSpace(),
                        _buildName(
                            isLarge: true,
                            name: profile?.name ?? username,
                            editing: state.isEditing),
                        _buildSpace(),
                        _buildDescription(
                            isCanEdit: state?.isCanEdit,
                            isLarge: true,
                            description: profile?.description,
                            editing: state.isEditing),
                        _buildSpace(small: false),
                        _buildSocial(profile?.urls, true, state.isEditing,
                            isCanEdit: state?.isCanEdit)
                      ],
                    ),
                    small: Column(
                      children: [
                        _buildImage(
                            isLarge: false,
                            url: profile?.image,
                            editing: state.isEditing),
                        _buildSpace(),
                        _buildName(
                            isLarge: false,
                            name: profile?.name ?? username,
                            editing: state.isEditing),
                        _buildSpace(),
                        _buildDescription(
                            isCanEdit: state?.isCanEdit,
                            isLarge: false,
                            description: profile?.description,
                            editing: state.isEditing),
                        _buildSpace(small: true),
                        _buildSocial(profile?.urls, false, state.isEditing,
                            isCanEdit: state?.isCanEdit)
                      ],
                    ),
                  )),
            ),
          );
        else
          return Container();
      },
    );
  }

  Widget _buildDescription(
          {bool isLarge = false,
          bool editing,
          String description,
          bool isCanEdit}) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          description == null || description.length == 0
              ? (editing
                  ? Text(
                      AppLocalizations.of(context)
                          .translate('about.description'),
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.center,
                      textScaleFactor: isLarge ? 1.65 : 1.35,
                    )
                  : const SizedBox())
              : Text(
                  AppUtils.parseDescriptionToString(description),
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                  textScaleFactor: isLarge ? 1.65 : 1.35,
                ),
          editing
              ? FlatButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  onPressed: () => AppDialogs.createNotify(
                          widget: WidgetDescriptionEditAbout(
                        username: username,
                      )),
                  icon: SizedBox(
                    width: 16,
                    height: 16,
                    child: FittedBox(
                      child: Icon(Icons.edit),
                    ),
                  ),
                  label: Text(
                    AppLocalizations.of(context).translate('app.edit'),
                    textScaleFactor: 0.8,
                  ))
              : SizedBox()
        ],
      );

  Widget _buildSocial(String urls, bool isLarge, bool editing,
      {bool isCanEdit}) {
    List<Widget> socialButtons = [];
    AppUtils.parseURL(urls).forEach((element) {
      socialButtons.add(_buildFlatButtonURL(model: element));
    });
    return Column(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: socialButtons.length == 0
              ? [
                  editing
                      ? Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .translate('about.social'),
                              style: Theme.of(context).textTheme.caption,
                              textAlign: TextAlign.center,
                              textScaleFactor: isLarge ? 1.45 : 1.15,
                            ),
                            Wrap(children: [
                              _buildFlatButton(
                                  model: UrlSocialModel(
                                      icon: AppImages.icGithub,
                                      name: "GitHub")),
                              _buildFlatButton(
                                  model: UrlSocialModel(
                                      icon: AppImages.icMediumLight,
                                      name: "Medium")),
                              _buildFlatButton(
                                  model: UrlSocialModel(
                                      icon: AppImages.icFB, name: "Facebook"))
                            ])
                          ],
                        )
                      : SizedBox()
                ]
              : [
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: socialButtons
                        .getRange(0, (socialButtons.length / 2).floor())
                        .toList(),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: socialButtons
                        .getRange((socialButtons.length / 2).floor(),
                            socialButtons.length)
                        .toList(),
                  )
                ],
        ),
        editing
            ? FlatButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                onPressed: () => AppDialogs.createNotify(
                        widget: WidgetSocialEditAbout(
                      username: username,
                    )),
                icon: SizedBox(
                  width: 18,
                  height: 18,
                  child: FittedBox(
                    child: Icon(Icons.edit),
                  ),
                ),
                label: Text(AppLocalizations.of(context).translate('app.edit')))
            : SizedBox(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _buildFlatButton({UrlSocialModel model, isDemo}) {
    return FlatButton.icon(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onPressed: () {},
        icon: SizedBox(
          width: 20,
          height: 20,
          child: Image.asset(model.icon),
        ),
        label: Text(model.name ?? ""));
  }

  Widget _buildFlatButtonURL({UrlSocialModel model}) {
    return FlatButton.icon(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onPressed: () {
          Html.window.open("${model.url}", 'Minh Minh - Portfolio website');
        },
        icon: SizedBox(
          width: 20,
          height: 20,
          child: model.isFromFirebase == 0
              ? Image.asset(model.icon)
              : CachedNetworkImage(
                  imageUrl: model.icon,
                  fit: BoxFit.fill,
                ),
        ),
        label: Text(model.name ?? ""));
  }

  Widget _buildName({bool isLarge = false, String name, bool editing}) =>
      editing
          ? WidgetInput(
              height: 60,
              paddingHorizontal: 15,
              inputController: _nameController,
              width: isLarge ? 350 : 280,
              radiusBorder: 16,
              paddingLeftMore: 12,
              textAlign: TextAlign.center,
              style: AppStyles.DEFAULT_LARGE,
              hintStyle: AppStyles.DEFAULT_MEDIUM
                  .copyWith(fontStyle: FontStyle.italic),
              endIcon: IconButton(
                icon: Icon(MaterialCommunityIcons.check),
                onPressed: () {
                  BlocProvider.of<AboutBloc>(context).add(EditAbout(
                      name: _nameController.text.trim().length != 0
                          ? _nameController.text.trim()
                          : null,
                      profileBloc: BlocProvider.of<ProfileBloc>(context)));
                },
              ),
              hint: name ??
                  AppLocalizations.of(context).translate('about.hint_name'),
            )
          : Text(
              name ?? "",
              textScaleFactor: isLarge ? 3.5 : 2.5,
            );

  Widget _buildImage(
          {bool isLarge = false, String url, bool editing = false}) =>
      SizedBox(
        height: isLarge ? 200 : 160,
        width: isLarge ? 200 : 160,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: url ?? "",
              imageBuilder: (context, image) => CircleAvatar(
                radius: isLarge ? 100 : 80,
                backgroundImage: image,
              ),
              placeholder: (context, url) => SizedBox(
                height: isLarge ? 200 : 160,
                width: isLarge ? 200 : 160,
                child: Center(child: WidgetCircleProgress()),
              ),
              errorWidget: (context, error, url) => CircleAvatar(
                radius: isLarge ? 100 : 80,
                backgroundImage: Image.asset(AppImages.imgAvatarDefault).image,
              ),
            ),
            editing
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CircleAvatar(
                          radius: isLarge ? 20 : 16,
                          child: Icon(
                            MaterialCommunityIcons.camera_image,
                            size: isLarge ? 26 : 20,
                          )),
                    ),
                  )
                : SizedBox()
          ],
        ),
      );

  Widget _buildSpace({bool small = true}) {
    return small
        ? const SizedBox(
            height: 20,
            width: 20,
          )
        : const SizedBox(
            height: 35,
            width: 35,
          );
  }
}
