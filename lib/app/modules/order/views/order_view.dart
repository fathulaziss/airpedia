import 'package:airpedia/app/modules/order/components/order_seat.dart';
import 'package:airpedia/app/modules/order/components/order_seat_button.dart';
import 'package:airpedia/app/modules/order/components/order_seat_information.dart';
import 'package:airpedia/app/modules/order/components/order_seat_status.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'ticketOrder'.tr,
      bottomBarHeight: 90.w,
      bottomBar: const OrderSeatButton(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.xl),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            verticalSpace(Insets.sm),
            Text('ticketOrderTitle'.tr, style: TextStyles.title),
            const OrderSeatStatus(),
            const OrderSeat(),
            const OrderSeatInformation(),
          ],
        ),
      ),
    );
  }
}
