import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingLanguageItem extends StatelessWidget {
  const SettingLanguageItem({
    super.key,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Insets.med),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyles.text,
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle_outline_rounded,
                    color: AppColor.primaryColor,
                    size: 18.w,
                  ),
              ],
            ),
            verticalSpace(Insets.xs),
            const Divider(color: AppColor.primaryColor2),
          ],
        ),
      ),
    );
  }
}
