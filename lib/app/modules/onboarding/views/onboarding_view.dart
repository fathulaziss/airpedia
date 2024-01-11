import 'package:airpedia/app/models/app_language_model.dart';
import 'package:airpedia/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/inputs/input_dropdown.dart';
import 'package:airpedia/widgets/others/input_dropdwon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 80.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAsset.image('img_background.png')),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'greetingTitle'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyles.title.copyWith(color: Colors.white),
                  ),
                  verticalSpace(10.w),
                  Text(
                    'greetingDesc'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyles.text.copyWith(color: AppColor.greyColor1),
                  ),
                  verticalSpace(50.w),
                  ButtonPrimary(
                    onTap: controller.getStarted,
                    label: 'start'.tr,
                    width: 220.w,
                  ),
                ],
              ),
              Positioned(
                top: 40.w,
                right: 0.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'chooseLanguage'.tr,
                      style:
                          TextStyles.text.copyWith(color: AppColor.greyColor2),
                    ),
                    verticalSpace(Insets.xs),
                    SizedBox(
                      width: 72.w,
                      child: InputDropdown(
                        hintText: '',
                        borderColor: Colors.blueGrey[200],
                        outlinedBorderColor: Colors.transparent,
                        textAlign: TextAlign.center,
                        items: [
                          ...controller.cUtility.appLanguageOptions.map((item) {
                            return DropdownMenuItem<AppLanguageModel>(
                              value: item,
                              child: InputDropdownItem(value: item.language),
                            );
                          }),
                        ],
                        selectedItem:
                            controller.cUtility.appLanguage.value.language,
                        onChanged: (value) {
                          if (value != null) {
                            final data = value as AppLanguageModel;
                            controller.cUtility.changeLanguage(data);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
