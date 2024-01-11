import 'package:airpedia/app/modules/register/controllers/register_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/buttons/button_text_rich.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:airpedia/widgets/inputs/input_date.dart';
import 'package:airpedia/widgets/inputs/input_email.dart';
import 'package:airpedia/widgets/inputs/input_password.dart';
import 'package:airpedia/widgets/inputs/input_primary.dart';
import 'package:airpedia/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'signUp'.tr,
        bottomBarHeight: 92.w,
        bottomBar: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
              child: ButtonPrimary(
                onTap: controller.register,
                label: 'signUp'.tr,
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                isLoading: controller.isLoading.value,
                enabled: controller.isValidForm.value,
              ),
            ),
            ButtonTextRich(
              label1: 'haveAccount'.tr,
              label2: 'signIn'.tr,
              onPressed: Get.back,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Flex(
            direction: Axis.vertical,
            children: [
              SizedBox(
                width: Get.width,
                child: Text(
                  'registerTitle'.tr,
                  style: TextStyles.title,
                ),
              ),
              verticalSpace(24.w),
              Expanded(
                child: CardApp(
                  width: double.infinity,
                  radius: Insets.lg,
                  padding: EdgeInsets.all(Insets.xl),
                  isShowShadows: true,
                  shadows: Shadows.universal,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InputPrimary(
                          label: 'fullNameLabel'.tr,
                          hint: 'fullNameHint'.tr,
                          controller: controller.cFullName,
                          onChanged: controller.setFullName,
                          validation: (value) => value.isNotEmpty,
                        ),
                        InputEmail(
                          label: 'emailAddressLabel'.tr,
                          hint: 'emailAddressHint'.tr,
                          controller: controller.cEmail,
                          value: controller.setEmail,
                          validationText: 'emailAddressValidationText2'.tr,
                        ),
                        InputDate(
                          label: 'dateOfBirthLabel'.tr,
                          hint: 'dateOfBirthHint'.tr,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1945),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: Insets.sm),
                            child: Icon(
                              Icons.calendar_month,
                              size: 24.w,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          controller: controller.cDateOfBirth,
                          value: controller.setDateOfBirth,
                        ),
                        InputPassword(
                          label: 'passwordLabel'.tr,
                          hint: 'passwordHint'.tr,
                          controller: controller.cPassword,
                          value: controller.setPassword,
                          validationText: 'passwordValidationText2'.tr,
                        ),
                        InputPassword(
                          label: 'pinTransactionLabel'.tr,
                          hint: 'pinTransactionHint'.tr,
                          controller: controller.cPinTransaction,
                          value: controller.setPinTransaction,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          validation: (value) {
                            if (value.length != 6) {
                              return false;
                            } else {
                              return true;
                            }
                          },
                          validationText: 'pinTransactionValidationText'.tr,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
