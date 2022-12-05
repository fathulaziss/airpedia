import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:airpedia/widgets/others/shimmer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecommendedDestinationShimmerItem extends StatelessWidget {
  const RecommendedDestinationShimmerItem({super.key, required this.margin});

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return CardApp(
      width: 200.w,
      margin: margin,
      isShowShadows: true,
      shadows: Shadows.universal,
      radius: 18.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerIndicator(
            width: double.infinity,
            height: 200.w,
            borderRadius: 18.w,
          ),
          verticalSpace(Insets.xl),
          ShimmerIndicator(
            width: Get.width / 2.5,
            height: 10.w,
            borderRadius: 4.w,
          ),
          verticalSpace(Insets.xs),
          ShimmerIndicator(
            width: Get.width / 4,
            height: 10.w,
            borderRadius: 4.w,
          ),
        ],
      ),
    );
  }
}
