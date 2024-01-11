import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonTextRich extends StatelessWidget {
  const ButtonTextRich({
    required this.label1,
    required this.label2,
    required this.onPressed,
    super.key,
  });

  final String label1;
  final String label2;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.all(AppColor.greyColor1.withOpacity(0.1)),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: RichText(
        text: TextSpan(
          text: label1,
          style: TextStyles.text.copyWith(color: AppColor.greyColor1),
          children: <TextSpan>[
            TextSpan(
              text: label2,
              style: TextStyles.title
                  .copyWith(color: AppColor.primaryColor, fontSize: 14.w),
            ),
          ],
        ),
      ),
    );
  }
}
