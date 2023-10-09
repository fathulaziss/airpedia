import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.image('img_booking_success.png'),
                width: 300.w,
                height: 150.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Insets.lg),
                child: Text(
                  'ticketOrderSuccessTitle'.tr,
                  style: TextStyles.title.copyWith(fontSize: 24.w),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Text(
                  'ticketOrderSuccessDesc'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyles.text
                      .copyWith(fontSize: 16.w, color: AppColor.greyColor1),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 48.w, vertical: Insets.lg),
                child: ButtonPrimary(
                  label: 'checkYourTicket'.tr,
                  onTap: () =>
                      Get.offAllNamed(Routes.HOME, arguments: {'index': 1}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
