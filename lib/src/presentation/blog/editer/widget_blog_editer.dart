import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/blog/editer/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/widgets/widgets.dart';
import 'package:portfolio_website/src/resource/resource.dart';

import '../../presentation.dart';

class WidgetBlogEditer extends StatelessWidget {
  final String username;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  File image;
  WidgetBlogEditer({this.username});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogEditerBloc, BlogEditerState>(
      builder: (context, state) {
        if (state is BlogEditerLoading) {
          return _buildFrame(
              child: Center(
                child: WidgetCircleProgress(),
              ),
              context: context);
        } else if (state is BlogEditerLoaded) {
          Blog blog = state.blog;
          _titleController.text = blog?.title ?? "";
          _urlController.text = blog?.url ?? "";
          _descController.text = blog?.description ?? "";
          return _buildContent(blog, context);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildContent(Blog blog, BuildContext context) {
    return _buildFrame(
        context: context,
        child: Stack(
          children: [_buildEditer(blog, context), _buildClose(context)],
        ));
  }

  Widget _buildFrame({BuildContext context, Widget child}) {
    return Container(
      width: WidgetResponse.isLargeScreen(context) ? 500 : 350,
      height: Get.height - 65,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ThemeSwitcher.of(context).isLightMode
              ? Colors.white
              : Colors.white24),
      child: child,
    );
  }

  Widget _buildEditer(Blog blog, context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: Column(
              children: [
                _buildPhoto(
                    context, blog.image, (blog.isFromFirebase ?? 0) == 1),
                _buildInputTitle(context),
                _buildUrl(context),
                _buildDescription(context),
                _buildSave(context, blog)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoto(
      BuildContext context, String imageUri, bool isFromFirebase) {
    Widget imageWidget;
    if (image != null) {
      imageWidget = Image.file(image);
    } else if (imageUri != null && imageUri.length != 0) {
      imageWidget =
          isFromFirebase ? Image.network(imageUri) : Image.asset(imageUri);
    } else {
      imageWidget = Image.asset(AppImages.icAddPhoto);
    }
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.grey,
      ),
      child: Container(
          padding: EdgeInsets.all(20), child: Center(child: imageWidget)),
    );
  }

  Widget _buildInputTitle(BuildContext context) {
    return Container(
      child: WidgetInput(
        inputController: _titleController,
        height: AppValues.INPUT_FORM_HEIGHT,
        hint: AppLocalizations.of(context).translate('blog.title.hint'),
        style: AppStyles.DEFAULT_MEDIUM_BOLD,
      ),
    );
  }

  Widget _buildUrl(BuildContext context) {
    return Container(
      child: WidgetInput(
        inputController: _urlController,
        height: AppValues.INPUT_FORM_HEIGHT,
        hint: AppLocalizations.of(context).translate('blog.url.hint'),
        style: AppStyles.DEFAULT_MEDIUM,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Container(
      child: WidgetInput(
        paddingVertical: 16,
        inputController: _descController,
        maxLines: 20,
        height: AppValues.INPUT_FORM_HEIGHT * 5,
        hint: AppLocalizations.of(context).translate('blog.title.description'),
      ),
    );
  }

  Widget _buildSave(BuildContext context, Blog blog) {
    return Center(
      child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context).translate('blog.save'),
                style: AppStyles.DEFAULT_SMALL,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 4,
              ),
              Icon(Icons.save),
            ],
          ),
          onPressed: () {
            BlocProvider.of<BlogEditerBloc>(context).add(SaveBlogEditer(
                bloc: BlocProvider.of(context),
                blog: blog.copyWith(
                    url: _urlController.text.trim(),
                    title: _titleController.text.trim(),
                    description: _descController.text.trim()),
                username: username));
          }),
    );
  }

  Widget _buildClose(BuildContext context,
      {double top = -10, double right = -20}) {
    return Positioned(
      top: top,
      right: right,
      child: FlatButton(
          shape: CircleBorder(),
          padding: EdgeInsets.all(8),
          child: Icon(Icons.close),
          onPressed: () {
            BlocProvider.of<BlogEditerBloc>(context).add(HideBlogEditer());
          }),
    );
  }
}
