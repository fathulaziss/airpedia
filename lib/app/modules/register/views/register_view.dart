import 'package:airpedia/app/modules/register/controllers/register_controller.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/buttons/button_text_rich.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:airpedia/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
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
              onTap: () {},
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
                padding: EdgeInsets.all(Insets.lg),
                isShowShadows: true,
                shadows: Shadows.universal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
