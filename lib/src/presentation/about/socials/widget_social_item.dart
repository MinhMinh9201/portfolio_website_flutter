import 'package:flutter/material.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/widgets/widgets.dart';
import 'package:portfolio_website/src/resource/model/model.dart';

class _ListItem {
  int id;
  String name;
  String value;

  _ListItem(this.id, this.name, this.value);
}

class WidgetSocialItem extends StatefulWidget {
  final UrlSocialModel data;
  final Function onChanged;
  const WidgetSocialItem({this.data, this.onChanged});
  @override
  _WidgetSocialItemState createState() => _WidgetSocialItemState();
}

class _WidgetSocialItemState extends State<WidgetSocialItem> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  List<_ListItem> providers = [
    _ListItem(0, "Facebook", AppImages.icFB),
    _ListItem(1, "Instagram", AppImages.icInstagram),
    _ListItem(2, "Github", AppImages.icGithub),
    _ListItem(3, "Medium", AppImages.icMediumLight),
    _ListItem(4, "LinkedIn", AppImages.icLinkedIn),
  ];
  int _value = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero);
    _titleController.text = widget.data?.name;
    _urlController.text = widget.data?.url;
    setState(() {
      _value = findIconProvider(widget.data?.name);
    });
  }

  int findIconProvider(String path) {
    if (path == null || path.length == 0) return 0;
    switch (path) {
      case "Facebook":
        return 0;
        break;
      case "Instagram":
        return 1;
        break;
      case "Github":
        return 2;
        break;
      case "Medium":
        return 3;
        break;
      case "LinkedIn":
        return 4;
        break;
      default:
        return 0;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: WidgetResponse.isLargeScreen(context) ? 65 : 10),
      padding: EdgeInsets.symmetric(
          horizontal: WidgetResponse.isLargeScreen(context) ? 12 : 6),
      height: WidgetResponse.isLargeScreen(context) ? 50 : 46,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              _buildDropButton(),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: _titleController,
                  onChanged: (value) {
                    if (widget.onChanged != null)
                      widget
                          .onChanged(UrlSocialModel(
                            isFromFirebase: 0,
                            icon: providers[_value].value,
                            name: value.trim(),
                            url: _urlController.text.trim(),
                            description: widget.data?.description,
                          ))
                          .call();
                  },
                  autovalidate: false,
                  style: AppStyles.DEFAULT_MEDIUM_BOLD,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration.collapsed(
                      hintText: AppLocalizations.of(context)
                          .translate('about.hint_social_name'),
                      hintStyle: AppStyles.DEFAULT_SMALL
                          .copyWith(fontStyle: FontStyle.italic)),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: _urlController,
                  onChanged: (value) {
                    if (widget.onChanged != null)
                      widget
                          .onChanged(UrlSocialModel(
                            isFromFirebase: 0,
                            icon: providers[_value].value,
                            name: _titleController.text.trim(),
                            url: value.trim(),
                            description: widget.data?.description,
                          ))
                          .call();
                  },
                  autovalidate: false,
                  style: AppStyles.DEFAULT_MEDIUM_BOLD,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration.collapsed(
                      hintText: AppLocalizations.of(context)
                          .translate('about.hint_social_url'),
                      hintStyle: AppStyles.DEFAULT_SMALL
                          .copyWith(fontStyle: FontStyle.italic)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropButton() {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: _value,
            items: List<DropdownMenuItem>.generate(
                providers.length,
                (index) => DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset(providers[index]?.value ?? ""),
                        ),
                      ),
                      value: index,
                    )),
            onChanged: (value) {
              setState(() {
                _value = value;
              });
              _titleController.text = providers[value].name;
              if (widget.onChanged != null)
                widget
                    .onChanged(UrlSocialModel(
                      isFromFirebase: 0,
                      icon: providers[value].value,
                      name: _titleController.text.trim(),
                      url: _urlController.text.trim(),
                      description: widget.data?.description,
                    ))
                    .call();
            }),
      ),
    );
  }
}
