import 'package:airpedia/app/modules/onboarding/components/onboarding_slidetile.dart';
import 'package:airpedia/app/modules/onboarding/components/onboarding_slidetile_indicator.dart';
import 'package:airpedia/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/constants/constant.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_storage.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Flex(
          direction: Axis.vertical,
          children: [
            verticalSpace(Insets.xxl * 2),
            Expanded(
              child: PageView(
                controller: controller.cSlideTile,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (index) {
                  controller.slideIndex(index);
                },
                children: [
                  ...controller.listSlideTile.map((e) {
                    return OnboardingSlidetile(data: e);
                  }),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 144.w,
              child: (controller.slideIndex.value == 2)
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: ButtonPrimary(
                        onTap: () {
                          AppStorage.write(
                            key: APP_FIRST_TIME_OPEN,
                            value: 'true',
                          );
                          Get.offNamed(Routes.LOGIN);
                        },
                        label: 'MULAI',
                      ),
                    )
                  : OnboardingSlidetileIndicator(
                      activeIndex: controller.slideIndex.value,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
