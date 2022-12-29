import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSeatItem extends StatelessWidget {
  const OrderSeatItem({
    super.key,
    required this.isAvailable,
    required this.isSelect,
    required this.onTap,
  });

  final bool isAvailable;
  final bool isSelect;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isAvailable) {
          onTap();
        }
      },
      child: CardApp(
        width: 48.w,
        constraints: BoxConstraints(minHeight: 48.w),
        margin: EdgeInsets.only(bottom: Insets.lg),
        padding: EdgeInsets.zero,
        isOutlined: true,
        outlineColor: isSelect
            ? AppColor.primaryColor
            : isAvailable
                ? AppColor.primaryColor
                : Colors.transparent,
        color: isSelect
            ? AppColor.primaryColor
            : isAvailable
                ? AppColor.primaryColor2
                : AppColor.greyColor2,
        child: isSelect
            ? Center(
                child: Text(
                  'YOU',
                  style: TextStyles.title
                      .copyWith(fontSize: 14.w, color: Colors.white),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
