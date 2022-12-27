import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:airpedia/widgets/others/shimmer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewDestinationShimmerItem extends StatelessWidget {
  const NewDestinationShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CardApp(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.w),
      radius: 18.w,
      isShowShadows: true,
      shadows: Shadows.universal,
      child: Row(
        children: [
          ShimmerIndicator(
            width: 70.w,
            height: 70.w,
            borderRadius: 18.w,
          ),
          horizontalSpace(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerIndicator(
                  width: Get.width / 2.5,
                  height: 10.w,
                  borderRadius: 4.w,
                ),
                verticalSpace(Insets.med),
                ShimmerIndicator(
                  width: Get.width / 4,
                  height: 10.w,
                  borderRadius: 4.w,
                ),
              ],
            ),
          ),
          horizontalSpace(Insets.xs),
        ],
      ),
    );
  }
}
