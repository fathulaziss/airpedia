import 'package:airpedia/app/modules/destination/controllers/destination_controller.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DestinationHeaderOne extends GetView<DestinationController> {
  const DestinationHeaderOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Stack(
        children: [
          Align(
            child: Image.asset(
              AppAsset.image(controller.data.value.image),
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Corners.xxlRadius,
                  topRight: Corners.xxlRadius,
                ),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CardApp(
                    width: 70.w,
                    height: 8.w,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(minHeight: 8.w),
                    color: const Color(0xFFD9D9D9),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
