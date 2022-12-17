import 'package:airpedia/app/modules/order/components/order_detail_button.dart';
import 'package:airpedia/app/modules/order/components/order_detail_facilities.dart';
import 'package:airpedia/app/modules/order/components/order_detail_flight.dart';
import 'package:airpedia/app/modules/order/components/order_detail_header.dart';
import 'package:airpedia/app/modules/order/components/order_detail_price.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:flutter/material.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const OrderDetailButton(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xl),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                OrderDetailHeader(),
                OrderDetailFlight(),
                OrderDetailFacilities(),
                OrderDetailPrice(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
