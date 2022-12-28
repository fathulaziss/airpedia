import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryEmpty extends StatelessWidget {
  const HistoryEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAsset.image('img_empty.png'), width: 200.w),
          verticalSpace(Insets.med),
          Text(
            'dontHaveTransaction'.tr,
            style: TextStyles.text.copyWith(color: AppColor.greyColor1),
          ),
          verticalSpace(55.w),
        ],
      ),
    );
  }
}
