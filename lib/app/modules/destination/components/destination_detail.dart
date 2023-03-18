import 'package:airpedia/app/models/destination_model.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DestinationDetail extends StatelessWidget {
  const DestinationDetail({super.key, required this.data});

  final DestinationModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: Insets.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('about'.tr, style: TextStyles.title),
          verticalSpace(Insets.xs),
          Text(data.about.tr, style: TextStyles.text),
          verticalSpace(Insets.lg),
          Text('photos'.tr, style: TextStyles.title),
          Row(
            children: [
              ...data.photos.map((e) {
                final index = data.photos.indexOf(e);
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 16.w,
                    right: index == data.photos.length - 1 ? 16.w : 0,
                    top: 4.w,
                  ),
                  child: ClipRRect(
                    borderRadius: Corners.medBorder,
                    child: Image.asset(
                      AppAsset.image(e),
                      fit: BoxFit.cover,
                      width: 70.w,
                      height: 70.w,
                    ),
                  ),
                );
              }),
            ],
          ),
          verticalSpace(Insets.lg),
          Text('attraction'.tr, style: TextStyles.title),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 6,
            ),
            itemCount: data.interests.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.asset(AppAsset.icon('ic_check.png'), width: 16.w),
                  horizontalSpace(Insets.xs),
                  Text(
                    data.interests[index].toString().tr,
                    style: TextStyles.desc,
                  ),
                ],
              );
            },
          ),
          verticalSpace(40.w),
        ],
      ),
    );
  }
}
