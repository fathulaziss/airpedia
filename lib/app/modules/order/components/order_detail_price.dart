import 'package:airpedia/app/modules/order/controllers/order_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/format_currency.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailPrice extends GetView<OrderController> {
  const OrderDetailPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Price Detail', style: TextStyles.text),
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
                  Text('Seat', style: TextStyles.desc),
                  horizontalSpace(Insets.xl * 3),
                  Expanded(
                    child: Text(
                      controller.selectedSeat
                          .map((item) => item.name)
                          .toList()
                          .join(', '),
                      style: TextStyles.title.copyWith(fontSize: 12.w),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              verticalSpace(Insets.xs),
              Row(
                children: [
                  Text(
                    'Passenger x ${controller.selectedSeat.length}',
                    style: TextStyles.desc,
                  ),
                  horizontalSpace(Insets.sm),
                  Expanded(
                    child: Text(
                      priceFormat(controller.totalSeatPrice.value),
                      style: TextStyles.title.copyWith(
                        fontSize: 12.w,
                        color: AppColor.primaryColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              verticalSpace(Insets.xs),
              Row(
                children: [
                  Text('VAT', style: TextStyles.desc),
                  horizontalSpace(Insets.sm),
                  Expanded(
                    child: Text(
                      priceFormat(controller.totalVatPrice.value),
                      style: TextStyles.title.copyWith(
                        fontSize: 12.w,
                        color: AppColor.primaryColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              verticalSpace(Insets.xs),
              const Divider(color: AppColor.primaryColor2, thickness: 1),
              Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyles.title.copyWith(fontSize: 12.w),
                  ),
                  horizontalSpace(Insets.sm),
                  Expanded(
                    child: Text(
                      priceFormat(controller.total.value),
                      style: TextStyles.title.copyWith(
                        fontSize: 12.w,
                        color: AppColor.primaryColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
