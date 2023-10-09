import 'package:airpedia/app/models/ticket_model.dart';
import 'package:airpedia/app/modules/ticket_detail/controllers/ticket_detail_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketDetailFacilities extends GetView<TicketDetailController> {
  const TicketDetailFacilities({super.key, required this.data});

  final TicketModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('flightFacilities'.tr, style: TextStyles.text),
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
                    Text('insurance'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.sm),
                    Expanded(
                      child: Text(
                        data.ticket.insurance
                            ? 'yes'.tr.toUpperCase()
                            : 'no'.tr.toUpperCase(),
                        style: TextStyles.title.copyWith(
                          fontSize: 12.w,
                          color: data.ticket.insurance
                              ? AppColor.greenColor
                              : AppColor.redColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                verticalSpace(Insets.xs),
                Row(
                  children: [
                    Text('refundable'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.sm),
                    Expanded(
                      child: Text(
                        data.ticket.refundable
                            ? 'yes'.tr.toUpperCase()
                            : 'no'.tr.toUpperCase(),
                        style: TextStyles.title.copyWith(
                          fontSize: 12.w,
                          color: data.ticket.refundable
                              ? AppColor.greenColor
                              : AppColor.redColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                verticalSpace(Insets.xs),
                Row(
                  children: [
                    Text('others'.tr, style: TextStyles.desc),
                    horizontalSpace(Insets.xxl),
                    Expanded(
                      child: Text(
                        data.ticket.benefit
                            .map(controller.checkBenefit)
                            .join(', '),
                        style: TextStyles.title.copyWith(fontSize: 10.w),
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
