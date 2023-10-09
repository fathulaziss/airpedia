import 'package:airpedia/app/models/ticket_model.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketDetailHeader extends StatelessWidget {
  const TicketDetailHeader({super.key, required this.data});

  final TicketModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Insets.xs),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Image.asset(
            AppAsset.image('img_departure_route.png'),
            width: Get.width,
          ),
        ),
        verticalSpace(Insets.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.ticket.airportDepartureCode.toUpperCase(),
                  style: TextStyles.title.copyWith(fontSize: 12.w),
                ),
                Text(
                  data.ticket.airportDepartureLocation,
                  style: TextStyles.desc.copyWith(color: AppColor.greyColor1),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data.ticket.airportArrivalCode.toUpperCase(),
                  style: TextStyles.title.copyWith(fontSize: 12.w),
                ),
                Text(
                  data.ticket.airportArrivalLocation,
                  style: TextStyles.desc.copyWith(color: AppColor.greyColor1),
                ),
              ],
            ),
          ],
        ),
        verticalSpace(Insets.lg),
      ],
    );
  }
}
