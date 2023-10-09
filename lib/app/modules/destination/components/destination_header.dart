import 'package:airpedia/app/models/destination_model.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DestinationHeader extends StatelessWidget {
  const DestinationHeader({super.key, required this.data});

  final DestinationModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Stack(
        children: [
          Align(
            child: Image.asset(
              AppAsset.image(data.image),
              width: Get.width,
              height: Get.height,
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
                boxShadow: const [
                  BoxShadow(color: Colors.white, offset: Offset(0, 1)),
                ],
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
