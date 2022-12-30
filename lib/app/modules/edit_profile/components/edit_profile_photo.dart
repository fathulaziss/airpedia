import 'package:airpedia/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfilePhoto extends GetView<EditProfileController> {
  const EditProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'editPhoto'.tr,
          style: TextStyles.title.copyWith(fontSize: 12.w),
        ),
        verticalSpace(Insets.med),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 88.w,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      // onTapCamera();
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    icon: SizedBox.square(
                      dimension: 55.w,
                      child: Image.asset(
                        AppAsset.icon('ic_camera2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(Insets.sm),
                  Text('camera'.tr, style: TextStyles.desc),
                ],
              ),
            ),
            SizedBox(
              width: 88.w,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      // onTapGallery();
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    icon: SizedBox.square(
                      dimension: 55.w,
                      child: Image.asset(
                        AppAsset.icon('ic_gallery.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(Insets.sm),
                  Text('gallery'.tr, style: TextStyles.desc),
                ],
              ),
            ),
            SizedBox(
              width: 88.w,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      // onTapRemove();
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    icon: SizedBox.square(
                      dimension: 55.w,
                      child: Image.asset(
                        AppAsset.icon('ic_remove.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(Insets.sm),
                  Text('removePhoto'.tr, style: TextStyles.desc),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
