import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/about/widget_description.dart';
import 'package:portfolio_website/presentation/about/widget_name.dart';
import 'package:portfolio_website/presentation/about/widget_socials.dart';
import 'package:portfolio_website/presentation/profile/bloc/bloc.dart';
import 'package:portfolio_website/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/presentation/widgets/widget_error_state.dart';
import 'dart:html' as Html;

import 'package:portfolio_website/presentation/widgets/widget_response.dart';
import 'package:portfolio_website/presentation/widgets/widgets.dart';
import 'package:portfolio_website/resource/resource.dart';

import 'bloc/bloc.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      String routeName = ModalRoute.of(context).settings.name;
      String username = routeName.substring(routeName.indexOf('@'));
      BlocProvider.of<AboutBloc>(context).add(LoadAbout(username: username));
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
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded && state.isEditing) {
          _nameController?.clear();
          _descriptionController?.clear();
        }
      },
      child: BlocBuilder<AboutBloc, AboutState>(builder: (context, state) {
        if (state is AboutLoading) {
          return Center(
            child: WidgetCircleProgress(),
          );
        } else if (state is AboutLoaded) {
          return _buildContent(context: context, state: state);
        } else if (state is AboutWithError) {
          return WidgetErrorState(
            refresh: () async {
              BlocProvider.of<AboutBloc>(context).add(LoadAbout());
            },
          );
        } else {
          return WidgetErrorState(
            refresh: () async {
              BlocProvider.of<AboutBloc>(context).add(LoadAbout());
            },
            message: "Unknow state",
          );
        }
      }),
    );
  }

  Widget _buildContent({BuildContext context, AboutLoaded state}) {
    Profile profile = state?.profile;
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
                            url: profile.image,
                            editing: state.isEditing),
                        _buildSpace(),
                        _buildName(
                            isLarge: true,
                            name: profile.name,
                            editing: state.isEditing),
                        _buildSpace(),
                        _buildDescription(
                            isLarge: true,
                            description: profile?.description,
                            editing: state.isEditing),
                        _buildSpace(small: false),
                        _buildSocial(profile.urls)
                      ],
                    ),
                    small: Column(
                      children: [
                        _buildImage(
                            isLarge: false,
                            url: profile.image,
                            editing: state.isEditing),
                        _buildSpace(),
                        _buildName(
                            isLarge: false,
                            name: profile.name,
                            editing: state.isEditing),
                        _buildSpace(),
                        _buildDescription(
                            isLarge: false,
                            description: profile?.description,
                            editing: state.isEditing),
                        _buildSpace(small: false),
                        _buildSocial(profile.urls)
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
          {bool isLarge = false, bool editing, String description}) =>
      WidgetDescriptionAbout(
        controller: _descriptionController,
        editing: editing,
        isLarge: isLarge,
        description: description,
      );

  Widget _buildSocial(String urls) => WidgetSocialsAbout(urls: urls);

  Widget _buildName({bool isLarge = false, String name, bool editing}) =>
      WidgetNameAbout(
        controller: _nameController,
        editing: editing,
        isLarge: isLarge,
        name: name,
      );

  Widget _buildImage(
          {bool isLarge = false, String url, bool editing = false}) =>
      SizedBox(
        height: isLarge ? 200 : 180,
        width: isLarge ? 200 : 180,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: url,
              imageBuilder: (context, image) => CircleAvatar(
                radius: isLarge ? 100 : 90,
                backgroundImage: image,
              ),
              placeholder: (context, url) => SizedBox(
                height: isLarge ? 200 : 180,
                width: isLarge ? 200 : 180,
                child: Center(child: WidgetCircleProgress()),
              ),
              errorWidget: (context, error, url) => CircleAvatar(
                radius: isLarge ? 100 : 90,
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
