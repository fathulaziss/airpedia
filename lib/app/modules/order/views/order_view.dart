import 'package:airpedia/app/modules/order/components/order_seat.dart';
import 'package:airpedia/app/modules/order/components/order_seat_button.dart';
import 'package:airpedia/app/modules/order/components/order_seat_information.dart';
import 'package:airpedia/app/modules/order/components/order_seat_status.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const OrderSeatButton(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xl),
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.vertical,
            children: [
              verticalSpace(Insets.xl),
              Text('Select Your\nFavorite Seat', style: TextStyles.title),
              const OrderSeatStatus(),
              const OrderSeat(),
              const OrderSeatInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
