import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputDropdown extends StatelessWidget {
  const InputDropdown({
    super.key,
    this.title = '',
    this.hintText,
    required this.items,
    required this.selectedItem,
    this.onChanged,
    this.titleColor = Colors.black,
    this.borderColor,
    this.outlinedBorderColor,
    this.textAlign,
  });

  final String title;
  final String? hintText;
  final List<DropdownMenuItem<Object>> items;
  final String selectedItem;
  final Function(Object?)? onChanged;
  final Color titleColor;
  final Color? borderColor;
  final Color? outlinedBorderColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: Insets.sm),
            child: Text(
              title,
              style: TextStyles.text.copyWith(color: titleColor),
            ),
          ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: borderColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(Corners.sm),
            border:
                Border.all(color: outlinedBorderColor ?? Colors.grey.shade300),
          ),
          child: DropdownButton2(
            underline: const SizedBox(),
            customButton: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedItem.isNotEmpty
                        ? selectedItem
                        : hintText ?? 'Choose Item',
                    textAlign: textAlign ?? TextAlign.left,
                    style: TextStyles.text.copyWith(
                      color: selectedItem.isNotEmpty
                          ? Colors.black
                          : const Color(0xFFC1BABA),
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: AppColor.primaryColor),
              ],
            ),
            items: items,
            onChanged: onChanged,
          ),
        ),
        verticalSpace(Insets.sm),
      ],
    );
  }
}
