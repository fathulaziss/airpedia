import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:airpedia/widgets/inputs/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputCurrency extends StatefulWidget {
  const InputCurrency({
    super.key,
    this.controller,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.textColor = Colors.black,
    this.margin,
    this.padding,
    this.enable = true,
    this.validation,
    this.inputFormatters,
    this.hint = 'Type Here...',
    this.validationText = '',
    this.textStyle,
    this.hintStyle,
    this.errorTextStyle,
    this.maxLength = 50,
    this.value,
    this.inputStyle = InputStyle.box,
    this.contentPadding,
    this.textAlign,
    this.outlineColor,
    this.borderRadius,
    this.hintColor,
  });

  final bool? Function(String value)? validation;
  final Color? color;
  final TextEditingController? controller;
  final bool enable;
  final TextStyle? errorTextStyle;
  final String hint;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final InputStyle inputStyle;
  final String? label;
  final EdgeInsets? margin;
  final int maxLength;
  final EdgeInsets? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color textColor;
  final TextStyle? textStyle;
  final String validationText;
  final ValueSetter<int>? value;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final Color? outlineColor;
  final double? borderRadius;
  final Color? hintColor;

  @override
  State<InputCurrency> createState() => _InputCurrencyState();
}

class _InputCurrencyState extends State<InputCurrency> {
  List<TextInputFormatter> formatter = [];

  @override
  void initState() {
    super.initState();
    if (widget.inputFormatters == null) {
      formatter
        ..add(FilteringTextInputFormatter.digitsOnly)
        ..add(ThousandsSeparatorInputFormatter());
    } else {
      formatter = widget.inputFormatters!;
      formatter
        ..add(FilteringTextInputFormatter.digitsOnly)
        ..add(ThousandsSeparatorInputFormatter());
    }
  }

  _onChanged(String value) {
    widget.value?.call(int.tryParse(value.replaceAll('.', '')) ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return InputPrimary(
      controller: widget.controller,
      hint: widget.hint,
      inputFormatters: formatter,
      keyboardType: TextInputType.number,
      label: widget.label,
      inputStyle: widget.inputStyle,
      prefixIcon: widget.prefixIcon ??
          Padding(
            padding: EdgeInsets.all(Insets.med),
            child: Text(
              'IDR',
              style: TextStyles.title
                  .copyWith(color: widget.textColor, fontSize: 14.w),
            ),
          ),
      suffixIcon: widget.suffixIcon,
      color: widget.color,
      textColor: widget.textColor,
      margin: widget.margin,
      padding: widget.padding,
      enable: widget.enable,
      validation: widget.validation,
      validationText: widget.validationText,
      textStyle: widget.textStyle,
      hintStyle: widget.hintStyle,
      errorTextStyle: widget.errorTextStyle,
      maxLength: widget.maxLength,
      onChanged: _onChanged,
      contentPadding: widget.contentPadding,
      textAlign: widget.textAlign ?? TextAlign.left,
      outlineColor: widget.outlineColor,
      borderRadius: widget.borderRadius,
      hintColor: widget.hintColor,
    );
  }
}
