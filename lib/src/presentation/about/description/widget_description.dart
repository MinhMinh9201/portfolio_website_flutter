import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/about/bloc/about_bloc.dart';
import 'package:portfolio_website/src/presentation/about/description/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/widgets/widgets.dart';
import 'package:portfolio_website/src/utils/utils.dart';

class WidgetDescriptionEditAbout extends StatelessWidget {
  final Color grey = AppColors.grey;
  final Color black45 = Colors.black45;
  Map<String, dynamic> result = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    BlocProvider.of<DescriptionBloc>(context).add(
        InitializeDescription(aboutBloc: BlocProvider.of<AboutBloc>(context)));

    return Container(
      margin: const EdgeInsets.all(45),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Stack(
        children: [
          BlocListener<DescriptionBloc, DescriptionState>(
            listener: (context, state) {
              if (state is DescriptionSaved) {
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              }
            },
            child: BlocBuilder<DescriptionBloc, DescriptionState>(
              builder: (context, state) {
                if (state is DescriptionLoading) {
                  return Center(
                    child: WidgetCircleProgress(),
                  );
                } else if (state is DescriptionInitialized) {
                  return _buildContent(state.description, context);
                } else if (state is DescriptionSaved) {
                  return WidgetErrorState(message: "Saved");
                } else {
                  return WidgetErrorState(
                    message: "Unknow state",
                    refresh: () async {
                      BlocProvider.of<DescriptionBloc>(context).add(
                          InitializeDescription(
                              aboutBloc: BlocProvider.of<AboutBloc>(context)));
                    },
                  );
                }
              },
            ),
          ),
          _buildClose(context, top: -15, right: -15)
        ],
      ),
    );
  }

  Widget _buildContent(String description, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            child: Text(
              AppLocalizations.of(context).translate('about.description.title'),
              style: AppStyles.DEFAULT_MEDIUM_BOLD,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            child: Text(
              AppLocalizations.of(context).translate('about.description.help'),
              style: AppStyles.DEFAULT_SMALL.copyWith(color: black45),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildWrapAutomate(description, context),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('about.save'),
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
                  print(result.toString());
                }),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildWrapAutomate(String description, BuildContext context) {
    return WidgetWrapAutomate<String>(
      result: result,
      data: AppUtils.parseDescriptionToList(description),
      widgetChild: widgetChild,
    );
  }

  Widget widgetChild(data, action) {
    return _buildInput(Get.context, data, action);
  }

  _buildInput(BuildContext context, String data, Function onChanged) {
    TextEditingController controller = TextEditingController();
    controller.text = data ?? "";
    return WidgetInput(
      inputController: controller,
      height: 46,
      paddingHorizontal: 12,
      width: 180,
      onChanged: onChanged,
      radiusBorder: 16,
      paddingLeftMore: 12,
      textAlign: TextAlign.center,
      style: AppStyles.DEFAULT_MEDIUM_BOLD,
      hint: AppLocalizations.of(context).translate('about.hint_description'),
    );
  }

  Widget _buildClose(BuildContext context, {double top = 0, double right = 0}) {
    return Positioned(
      top: top,
      right: right,
      child: FlatButton(
          shape: CircleBorder(),
          padding: EdgeInsets.all(8),
          child: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
