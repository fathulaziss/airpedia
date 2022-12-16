import 'package:airpedia/app/modules/order/components/order_detail_facilities.dart';
import 'package:airpedia/app/modules/order/components/order_detail_flight.dart';
import 'package:airpedia/app/modules/order/components/order_detail_header.dart';
import 'package:airpedia/app/modules/order/components/order_detail_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          20.w,
          MediaQuery.of(context).viewPadding.top,
          20.w,
          0,
        ),
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
    );
  }
}
