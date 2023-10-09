import 'package:airpedia/app/modules/order/controllers/order_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailFacilities extends GetView<OrderController> {
  const OrderDetailFacilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('flightFacilities'.tr, style: TextStyles.text),
          verticalSpace(Insets.sm),
          CardApp(
            isShowShadows: true,
            shadows: Shadows.shadowsUp,
            radius: 16.w,
            margin: EdgeInsets.only(bottom: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('insurance'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.sm),
                    Expanded(
                      child: Text(
                        controller
                                .cDestination.destinationTicket.value.insurance
                            ? 'yes'.tr.toUpperCase()
                            : 'no'.tr.toUpperCase(),
                        style: TextStyles.title.copyWith(
                          fontSize: 12.w,
                          color: controller.cDestination.destinationTicket.value
                                  .insurance
                              ? AppColor.greenColor
                              : AppColor.redColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                verticalSpace(Insets.xs),
                Row(
                  children: [
                    Text('refundable'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.sm),
                    Expanded(
                      child: Text(
                        controller
                                .cDestination.destinationTicket.value.refundable
                            ? 'yes'.tr.toUpperCase()
                            : 'no'.tr.toUpperCase(),
                        style: TextStyles.title.copyWith(
                          fontSize: 12.w,
                          color: controller.cDestination.destinationTicket.value
                                  .refundable
                              ? AppColor.greenColor
                              : AppColor.redColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                verticalSpace(Insets.xs),
                Row(
                  children: [
                    Text('others'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.xxl),
                    Expanded(
                      child: Text(
                        controller.cDestination.destinationTicket.value.benefit
                            .join(', '),
                        style: TextStyles.title.copyWith(fontSize: 10.w),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
