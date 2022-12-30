import 'package:airpedia/app/modules/edit_profile/components/edit_profile_photo.dart';
import 'package:airpedia/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/others/bottomsheet_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileHeader extends GetView<EditProfileController> {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: Get.width,
        height: Get.height / 5,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          boxShadow: Shadows.shadowsDown,
        ),
        padding: EdgeInsets.symmetric(horizontal: Insets.xl),
        margin: EdgeInsets.only(bottom: Insets.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                BottomSheetCustom(
                  context: context,
                  initialChildSize: 0.25,
                  child: const EditProfilePhoto(),
                ).showData();
              },
              child: SizedBox(
                width: 80.w,
                height: 80.w,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.w,
                      padding: EdgeInsets.all(5.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: controller
                              .cUserInfo.dataUser.value.imageProfile.isEmpty
                          ? Image.asset(AppAsset.image('img_photo_profile.png'))
                          : const SizedBox(),
                    ),
                    Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        AppAsset.icon('ic_camera.png'),
                        color: Colors.blueGrey[200],
                      ),
                    )
                  ],
                ),
              ),
            ),
            verticalSpace(Insets.lg),
          ],
        ),
      );
    });
  }
}
