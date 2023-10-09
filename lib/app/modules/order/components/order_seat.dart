import 'package:airpedia/app/modules/order/components/order_seat_item.dart';
import 'package:airpedia/app/modules/order/controllers/order_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSeat extends GetView<OrderController> {
  const OrderSeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Expanded(
        child: CardApp(
          radius: 16.w,
          isShowShadows: true,
          padding: EdgeInsets.all(Insets.lg),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    ...controller.listSeatType.map((item) {
                      return Expanded(
                        child: Text(
                          item,
                          style: TextStyles.text
                              .copyWith(color: AppColor.greyColor1),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }),
                  ],
                ),
                verticalSpace(Insets.lg),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ...controller.listSeatTypeA.map((item) {
                            return OrderSeatItem(
                              isAvailable: item.isAvailable,
                              isSelect: controller.selectedSeat.contains(item),
                              onTap: () => controller.chooseSeat(item),
                            );
                          }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ...controller.listSeatTypeB.map((item) {
                            return OrderSeatItem(
                              isAvailable: item.isAvailable,
                              isSelect: controller.selectedSeat.contains(item),
                              onTap: () => controller.chooseSeat(item),
                            );
                          }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ...controller.listSeatNumber.map((item) {
                            return CardApp(
                              width: 48.w,
                              constraints: BoxConstraints(minHeight: 48.w),
                              margin: EdgeInsets.only(bottom: Insets.lg),
                              padding: EdgeInsets.zero,
                              child: Center(
                                child: Text(
                                  item,
                                  style: TextStyles.text
                                      .copyWith(color: AppColor.greyColor1),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ...controller.listSeatTypeC.map((item) {
                            return OrderSeatItem(
                              isAvailable: item.isAvailable,
                              isSelect: controller.selectedSeat.contains(item),
                              onTap: () => controller.chooseSeat(item),
                            );
                          }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ...controller.listSeatTypeD.map((item) {
                            return OrderSeatItem(
                              isAvailable: item.isAvailable,
                              isSelect: controller.selectedSeat.contains(item),
                              onTap: () => controller.chooseSeat(item),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
