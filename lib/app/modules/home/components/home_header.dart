import 'package:airpedia/app/modules/home/controllers/home_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/utils/regex.dart';
import 'package:airpedia/widgets/others/shimmer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeHeader extends GetView<HomeController> {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(bottom: 16.w),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top + 12.w,
          bottom: 12.w,
          left: 20.w,
          right: 20.w,
        ),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Corners.xxlRadius * 1.2,
            bottomRight: Corners.xxlRadius * 1.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.isLoadingDataUser.value)
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.w),
                          child: ShimmerIndicator(
                            width: Get.width / 5,
                            height: Insets.med,
                            borderRadius: 3.w,
                          ),
                        )
                      else
                        Text(
                          'Hi,',
                          style: TextStyles.title.copyWith(color: Colors.white),
                        ),
                      if (controller.isLoadingDataUser.value)
                        ShimmerIndicator(
                          width: Get.width / 1.8,
                          height: Insets.med,
                          borderRadius: 3.w,
                        )
                      else
                        Text(
                          convertTitleCase(
                            controller.cUserInfo.dataUser.value.fullName,
                          ),
                          style: TextStyles.title.copyWith(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                if (controller.isLoadingDataUser.value)
                  Container(
                    width: 55.w,
                    height: 55.w,
                    padding: EdgeInsets.all(Insets.xs),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ShimmerIndicator(
                      width: 55.w,
                      height: 55.w,
                      shimmerStyle: ShimmerStyle.circle,
                    ),
                  )
                else
                  Container(
                    width: 55.w,
                    height: 55.w,
                    padding: EdgeInsets.all(3.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: controller
                            .cUserInfo.dataUser.value.imageProfile.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(55.w),
                            child: Image.network(
                              controller.cUserInfo.dataUser.value.imageProfile,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.asset(AppAsset.image('img_photo_profile.png')),
                  ),
              ],
            ),
            if (controller.isLoadingDataUser.value)
              ShimmerIndicator(
                width: Get.width / 3,
                height: Insets.med,
                borderRadius: 3.w,
              )
            else
              Text(
                'whereToFlightToday'.tr,
                style: TextStyles.text.copyWith(color: AppColor.primaryColor2),
              ),
          ],
        ),
      );
    });
  }
}
