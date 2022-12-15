import 'package:airpedia/app/modules/order/components/order_seat_status_item.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:flutter/material.dart';

class OrderSeatStatus extends StatelessWidget {
  const OrderSeatStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Insets.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          OrderSeatStatusItem(
            color: AppColor.primaryColor2,
            outlineColor: AppColor.primaryColor,
            label: 'Available',
          ),
          OrderSeatStatusItem(
            color: AppColor.primaryColor,
            outlineColor: AppColor.primaryColor,
            label: 'Selected',
          ),
          OrderSeatStatusItem(
            color: AppColor.greyColor2,
            outlineColor: Colors.transparent,
            label: 'Unavailable',
          ),
        ],
      ),
    );
  }
}
