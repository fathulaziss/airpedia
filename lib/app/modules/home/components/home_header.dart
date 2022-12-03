import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi,', style: TextStyles.title),
                    Text(
                      convertTitleCase('muhamad fathul azis'),
                      style: TextStyles.title,
                    ),
                  ],
                ),
              ),
              Image.asset(AppAsset.image('img_photo_profile.png'), width: 50.w)
            ],
          ),
          Text(
            'Where to flight today ?',
            style: TextStyles.text.copyWith(color: AppColor.greyColor1),
          ),
        ],
      ),
    );
  }
}
