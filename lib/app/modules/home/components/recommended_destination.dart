import 'package:airpedia/app/modules/home/components/recommended_destination_item.dart';
import 'package:airpedia/app/modules/home/components/recommended_destination_shimmer_item.dart';
import 'package:airpedia/app/modules/home/controllers/home_controller.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecommendedDestination extends GetView<HomeController> {
  const RecommendedDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recommended', style: TextStyles.title),
          SizedBox(
            width: double.infinity,
            height: 313.w,
            child: controller.listRecommendedDestination.isEmpty &&
                    !controller.isLoadingRecommendedDestination.value
                ? Center(
                    child: Text('Data Not Found', style: TextStyles.text),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.isLoadingRecommendedDestination.value
                        ? 5
                        : controller.listRecommendedDestination.length,
                    itemBuilder: (context, index) {
                      if (controller.isLoadingRecommendedDestination.value) {
                        return RecommendedDestinationShimmerItem(
                          margin: EdgeInsets.only(
                            left: (index == 0) ? 5.w : 24.w,
                            right: (index == 4) ? 5.w : 0,
                            top: 16.w,
                            bottom: 16.w,
                          ),
                        );
                      } else {
                        return RecommendedDestinationItem(
                          onTap: () => Get.toNamed(
                            Routes.DESTINATION,
                            arguments: {
                              'data':
                                  controller.listRecommendedDestination[index]
                            },
                          ),
                          data: controller.listRecommendedDestination[index],
                          margin: EdgeInsets.only(
                            left: (index == 0) ? 5.w : 24.w,
                            right: (index ==
                                    controller
                                            .listRecommendedDestination.length -
                                        1)
                                ? 5.w
                                : 0,
                            top: 16.w,
                            bottom: 16.w,
                          ),
                        );
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
