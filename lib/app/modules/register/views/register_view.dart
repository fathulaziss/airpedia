import 'package:airpedia/app/modules/register/controllers/register_controller.dart';
import 'package:airpedia/app/routes/app_pages.dart';
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
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'Register',
      bottomBarHeight: 90.w,
      bottomBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
            child: ButtonPrimary(
              onTap: () => Get.toNamed(Routes.REGISTER_SUCCESS),
              label: 'Register',
              margin: EdgeInsets.symmetric(horizontal: 24.w),
            ),
          ),
          ButtonTextRich(
            label1: 'Have an account? ',
            label2: 'Sign In',
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
                'Join us and\nget your next journey',
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
                        label: 'Full Name',
                        hint: 'Enter Full Name',
                        onChanged: (value) {},
                      ),
                      InputEmail(
                        label: 'Email Address',
                        hint: 'Enter Email Address',
                        value: (value) {},
                      ),
                      InputDate(
                        label: 'Date of Birth',
                        hint: 'Choose Date of Birth',
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: Insets.sm),
                          child: const Icon(
                            Icons.calendar_month,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        controller: controller.cDateOfBirth,
                        value: (value) {},
                      ),
                      InputPassword(
                        label: 'Password',
                        hint: 'Enter Password',
                        value: (value) {},
                      ),
                      InputPassword(
                        label: 'PIN Transaction',
                        hint: 'Enter PIN Transaction',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6),
                        ],
                        value: (value) {},
                        validation: (value) {
                          if (value.length != 6) {
                            return false;
                          } else {
                            return true;
                          }
                        },
                        validationText: "Pin transaction can't be empty",
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
