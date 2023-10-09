import 'package:airpedia/app/modules/order/controllers/order_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/format_currency.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSeatInformation extends GetView<OrderController> {
  const OrderSeatInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CardApp(
        radius: 16.w,
        isShowShadows: true,
        margin: EdgeInsets.symmetric(vertical: Insets.xl),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'yourSeat'.tr,
                  style: TextStyles.text.copyWith(color: AppColor.greyColor1),
                ),
                horizontalSpace(Insets.sm),
                Expanded(
                  child: Text(
                    controller.selectedSeat
                        .map((item) => item.name)
                        .toList()
                        .join(', '),
                    style: TextStyles.title.copyWith(fontSize: 12.w),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            verticalSpace(Insets.sm),
            Row(
              children: [
                Text(
                  'Total',
                  style: TextStyles.text.copyWith(color: AppColor.greyColor1),
                ),
                horizontalSpace(Insets.sm),
                Expanded(
                  child: Text(
                    priceFormat(controller.totalSeatPrice.value),
                    style: TextStyles.title
                        .copyWith(fontSize: 12.w, color: AppColor.primaryColor),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
