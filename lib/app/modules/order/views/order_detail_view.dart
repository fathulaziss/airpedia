import 'package:airpedia/app/modules/order/components/order_detail_button.dart';
import 'package:airpedia/app/modules/order/components/order_detail_facilities.dart';
import 'package:airpedia/app/modules/order/components/order_detail_flight.dart';
import 'package:airpedia/app/modules/order/components/order_detail_header.dart';
import 'package:airpedia/app/modules/order/components/order_detail_price.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'ticketConfirmation'.tr,
      bottomBarHeight: 150.w,
      bottomBar: const OrderDetailButton(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.xl),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              OrderDetailHeader(),
              OrderDetailFlight(),
              OrderDetailFacilities(),
              OrderDetailPrice(),
            ],
          ),
        ),
      ),
    );
  }
}
