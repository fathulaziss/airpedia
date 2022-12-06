import 'package:airpedia/app/modules/home/components/new_destination_item.dart';
import 'package:airpedia/app/modules/home/controllers/home_controller.dart';
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
          ...controller.listNewDestination.map((item) {
            final index = controller.listNewDestination.indexOf(item);
            return NewDestinationItem(
              data: item,
              onTap: () {},
              margin: EdgeInsets.only(
                top: (index == 0) ? 0 : 16.w,
                bottom: (index == controller.listNewDestination.length - 1)
                    ? 0.w
                    : 0,
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
