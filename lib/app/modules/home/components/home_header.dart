import 'package:airpedia/app/models/user_model.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.data});

  final UserModel data;

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      'Hi,',
                      style: TextStyles.title.copyWith(color: Colors.white),
                    ),
                    Text(
                      convertTitleCase(data.fullName),
                      style: TextStyles.title.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: 55.w,
                height: 55.w,
                padding: EdgeInsets.all(Insets.xs),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(AppAsset.image('img_photo_profile.png')),
              )
            ],
          ),
          Text(
            'Where to flight today ?',
            style: TextStyles.text.copyWith(color: AppColor.primaryColor2),
          ),
        ],
      ),
    );
  }
}
