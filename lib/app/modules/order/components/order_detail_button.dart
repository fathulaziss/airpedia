import 'package:airpedia/app/modules/order/controllers/order_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/utils/format_currency.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:airpedia/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailButton extends GetView<OrderController> {
  const OrderDetailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CardApp(
        height: 150.w,
        radius: 0,
        padding: EdgeInsets.symmetric(horizontal: Insets.xl),
        isShowShadows: true,
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'paymentMethod'.tr,
                  style: TextStyles.title.copyWith(fontSize: 12.w),
                ),
                InkWell(
                  onTap: () {
                    showPopUpInfo(
                      title: 'information'.tr,
                      description: 'underDevelopment'.tr,
                    );
                  },
                  child: CardApp(
                    width: 18.w,
                    constraints: BoxConstraints(minHeight: 18.w),
                    padding: EdgeInsets.zero,
                    color: AppColor.greyColor1,
                    radius: 50.w,
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 18.w,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(Insets.xs),
            Row(
              children: [
                CardApp(
                  width: 80.w,
                  constraints: BoxConstraints(minHeight: 20.w),
                  padding: EdgeInsets.all(Insets.sm),
                  margin: EdgeInsets.only(right: Insets.med),
                  radius: 8.w,
                  color: AppColor.primaryColor3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAsset.icon('ic_plane_white.png'),
                        width: 16.w,
                      ),
                      horizontalSpace(Insets.sm),
                      Text(
                        'AirPay',
                        style: TextStyles.title
                            .copyWith(fontSize: 12.w, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'balance'.tr,
                        style: TextStyles.desc
                            .copyWith(color: AppColor.greyColor1),
                      ),
                      Text(
                        priceFormat(
                          controller.cUserInfo.dataUser.value.balance,
                        ),
                        style: TextStyles.title.copyWith(
                          color: AppColor.primaryColor,
                          fontSize: 12.w,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(Insets.sm),
            ButtonPrimary(
              onTap: controller.submit,
              label: controller.cUserInfo.dataUser.value.balance >
                      controller.total.value
                  ? 'payNow'.tr
                  : 'topup'.tr,
              isLoading: controller.isLoading.value,
            ),
          ],
        ),
      );
    });
  }
}
