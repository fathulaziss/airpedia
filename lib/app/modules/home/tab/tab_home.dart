import 'package:airpedia/app/modules/home/components/home_header.dart';
import 'package:airpedia/app/modules/home/components/home_recommended_destination_item.dart';
import 'package:airpedia/app/modules/home/controllers/home_controller.dart';
import 'package:airpedia/services/app_cycle_service.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabHome extends GetView<HomeController> {
  const TabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.fromLTRB(
          24.w,
          MediaQuery.of(context).viewPadding.top,
          24.w,
          0,
        ),
        child: Column(
          children: [
            const HomeHeader(),
            verticalSpace(Insets.lg),
            SizedBox(
              width: Get.width,
              child: Text('Recommended', style: TextStyles.title),
            ),
            SizedBox(
              width: double.infinity,
              height: 333.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.listRecommendedDestination.length,
                itemBuilder: (context, index) {
                  return HomeRecommendedDestinationItem(
                    onTap: () {},
                    data: controller.listRecommendedDestination[index],
                    margin: EdgeInsets.only(
                      left: (index == 0) ? 5.w : 24.w,
                      right: (index ==
                              controller.listRecommendedDestination.length - 1)
                          ? 5.w
                          : 0,
                      top: 16.w,
                      bottom: 16.w,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: ButtonPrimary(
                label: 'Logout',
                onTap: () {
                  AppCycleService().onUserLogout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
