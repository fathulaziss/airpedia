import 'package:airpedia/app/modules/home/components/new_destination_item.dart';
import 'package:airpedia/app/modules/home/components/new_destination_shimmer_item.dart';
import 'package:airpedia/app/modules/home/controllers/home_controller.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewDestination extends GetView<HomeController> {
  const NewDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('New This Year', style: TextStyles.title),
          verticalSpace(Insets.lg),
          if (controller.isLoadingNewDestination.value)
            Column(
              children: const [
                NewDestinationShimmerItem(),
                NewDestinationShimmerItem(),
                NewDestinationShimmerItem(),
              ],
            )
          else if (controller.listNewDestination.isEmpty)
            SizedBox(
              width: Get.width,
              height: 100.w,
              child: Align(
                child: Text('Data Not Found', style: TextStyles.text),
              ),
            )
          else
            ...controller.listNewDestination.map((item) {
              final index = controller.listNewDestination.indexOf(item);
              return NewDestinationItem(
                data: item,
                onTap: () =>
                    Get.toNamed(Routes.DESTINATION, arguments: {'data': item}),
                margin: EdgeInsets.only(
                  bottom: (index == controller.listNewDestination.length - 1)
                      ? 0.w
                      : 16.w,
                  left: 5.w,
                  right: 5.w,
                ),
              );
            }),
        ],
      ),
    );
  }
}