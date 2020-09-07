import 'package:flutter/material.dart';
import 'package:portfolio_website/configs/configs.dart';

class WidgetInput extends StatefulWidget {
  final TextEditingController inputController;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String hint;
  final bool obscureText;
  final bool autovalidate;
  final TextInputType inputType;
  final Widget endIcon;
  final double height;
  final TextStyle style;
  final double radiusBorder;
  final double elevation;

  WidgetInput(
      {this.inputController,
      this.onChanged,
      this.validator,
      this.hint,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.autovalidate = false,
      this.endIcon,
      this.elevation,
      this.style,
      this.radiusBorder,
      this.height});

  @override
  _WidgetInputState createState() => _WidgetInputState();
}

class _WidgetInputState extends State<WidgetInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      height: widget.height ?? AppValues.INPUT_FORM_HEIGHT,
      child: Card(
        elevation: widget.elevation ?? 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radiusBorder ?? 20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.inputController,
                  onChanged: (change) {
                    widget.onChanged(change);
                  },
                  autovalidate: widget.autovalidate ?? false,
                  validator: widget.validator,
                  style: widget.style ?? AppStyles.DEFAULT_MEDIUM,
                  maxLines: 1,
                  keyboardType: widget.inputType ?? TextInputType.text,
                  textAlign: TextAlign.left,
                  obscureText: widget.obscureText,
                  decoration: InputDecoration.collapsed(
                    hintText: widget.hint,
                  ),
                ),
              ),
              widget.endIcon ?? const SizedBox()
            ],
          ),
        ),
      ),
    ));
  }
}
