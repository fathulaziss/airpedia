import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        radius: 16.w,
        margin: EdgeInsets.symmetric(horizontal: Insets.xl, vertical: 10.w),
        isShowShadows: true,
        shadows: Shadows.shadowsUp,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor,
              ),
              child: icon,
            ),
            horizontalSpace(Insets.sm),
            Expanded(child: Text(label, style: TextStyles.text)),
            Icon(Icons.arrow_forward_ios, size: 18.w)
          ],
        ),
      ),
    );
  }
}
