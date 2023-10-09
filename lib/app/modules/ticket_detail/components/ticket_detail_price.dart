import 'package:airpedia/app/models/ticket_model.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/format_currency.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketDetailPrice extends StatelessWidget {
  const TicketDetailPrice({super.key, required this.data});

  final TicketModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('priceDetail'.tr, style: TextStyles.text),
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
                    Text('seat'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.xl * 3),
                    Expanded(
                      child: Text(
                        data.selectedSeat,
                        style: TextStyles.title.copyWith(fontSize: 10.w),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                verticalSpace(Insets.xs),
                Row(
                  children: [
                    Text(
                      '${'passenger'.tr} x ${data.totalPassenger}',
                      style: TextStyles.desc,
                    ),
                    horizontalSpace(Insets.sm),
                    Expanded(
                      child: Text(
                        priceFormat(data.ticket.price * data.totalPassenger),
                        style: TextStyles.title.copyWith(
                          fontSize: 12.w,
                          color: AppColor.primaryColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                verticalSpace(Insets.xs),
                Row(
                  children: [
                    Text('tax'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.sm),
                    Expanded(
                      child: Text(
                        priceFormat(
                          (data.ticket.price * data.totalPassenger) *
                              data.ticket.vat,
                        ),
                        style: TextStyles.title.copyWith(
                          fontSize: 12.w,
                          color: AppColor.primaryColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
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
                        priceFormat(data.total),
                        style: TextStyles.title.copyWith(
                          fontSize: 12.w,
                          color: AppColor.primaryColor,
                        ),
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
