import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DestinationTicketEmpty extends StatelessWidget {
  const DestinationTicketEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAsset.image('img_empty.png'), width: 200.w),
        verticalSpace(Insets.med),
        Text(
          'flightNotAvailable'.tr,
          style: TextStyles.text.copyWith(color: AppColor.greyColor1),
        ),
      ],
    );
  }
}
