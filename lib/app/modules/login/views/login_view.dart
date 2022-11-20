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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign In and\nLet's start the journey",
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
                    label: 'Email Address',
                    hint: 'Enter Email Address',
                    value: (value) {},
                  ),
                  InputPassword(
                    label: 'Password',
                    value: (value) {},
                  ),
                ],
              ),
            ),
            verticalSpace(30.w),
            ButtonPrimary(
              label: 'login'.tr,
              onTap: () => Get.toNamed(Routes.HOME),
            ),
            SizedBox(
              width: double.infinity,
              child: ButtonTextRich(
                label1: "Don't have an account ? ",
                label2: 'Sign Up',
                onPressed: () => Get.toNamed(Routes.REGISTER),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
