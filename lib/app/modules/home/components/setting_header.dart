import 'package:airpedia/app/models/user_model.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key, required this.data});

  final UserModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 3,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        boxShadow: Shadows.shadowsDown,
      ),
      padding: EdgeInsets.symmetric(horizontal: Insets.xl),
      margin: EdgeInsets.only(bottom: Insets.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            padding: EdgeInsets.all(Insets.xs),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: data.imageProfile.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(88.w),
                    child: Image.network(
                      data.imageProfile,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(AppAsset.image('img_photo_profile.png')),
          ),
          verticalSpace(Insets.lg),
          Text(
            data.fullName,
            style:
                TextStyles.title.copyWith(color: Colors.white, fontSize: 14.w),
          ),
          Text(
            data.email,
            style: TextStyles.desc.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
