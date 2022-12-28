import 'package:airpedia/app/modules/login/controllers/login_controller.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/buttons/button_text_rich.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:airpedia/widgets/inputs/input_email.dart';
import 'package:airpedia/widgets/inputs/input_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'loginTitle'.tr,
                style: TextStyles.title,
              ),
              verticalSpace(30.w),
              CardApp(
                width: double.infinity,
                radius: Insets.lg,
                padding: EdgeInsets.all(Insets.lg),
                isShowShadows: true,
                shadows: Shadows.universal,
                child: Column(
                  children: [
                    InputEmail(
                      label: 'emailAddressLabel'.tr,
                      hint: 'emailAddressHint'.tr,
                      controller: controller.cEmail,
                      value: controller.setEmail,
                      validation: (value) => value.isNotEmpty,
                      validationText: 'emailAddressValidationText'.tr,
                    ),
                    InputPassword(
                      label: 'passwordLabel'.tr,
                      hint: 'passwordHint'.tr,
                      value: controller.setPassword,
                      validation: (value) => value.isNotEmpty,
                      validationText: 'passwordValidationText'.tr,
                    ),
                  ],
                ),
              ),
              verticalSpace(30.w),
              ButtonPrimary(
                label: 'signIn'.tr,
                onTap: controller.login,
                isLoading: controller.isLoading.value,
                enabled: controller.isValidForm.value,
              ),
              SizedBox(
                width: double.infinity,
                child: ButtonTextRich(
                  label1: 'dontHaveAccount'.tr,
                  label2: 'signUp'.tr,
                  onPressed: () => Get.toNamed(Routes.REGISTER),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
