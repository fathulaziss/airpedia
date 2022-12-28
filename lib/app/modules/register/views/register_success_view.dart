import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/cards/card_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterSuccessView extends StatelessWidget {
  const RegisterSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          24.w,
          MediaQuery.of(context).viewPadding.top,
          24.w,
          0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CardWallet(),
            verticalSpace(Insets.lg),
            Text(
              'registerSuccessTitle'.tr,
              style: TextStyles.title
                  .copyWith(fontSize: 18.w, color: Colors.black),
            ),
            verticalSpace(Insets.xs),
            Text(
              'registerSuccessDesc'.tr,
              textAlign: TextAlign.center,
              style: TextStyles.text.copyWith(color: AppColor.greyColor1),
            ),
            verticalSpace(Insets.lg),
            ButtonPrimary(
              onTap: () => Get.offNamed(Routes.HOME),
              label: 'start'.tr,
              width: 200.w,
            ),
          ],
        ),
      ),
    );
  }
}
