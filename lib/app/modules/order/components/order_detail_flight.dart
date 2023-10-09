import 'package:airpedia/app/modules/order/controllers/order_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/utils/format_date_time.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderDetailFlight extends GetView<OrderController> {
  const OrderDetailFlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('flightDetail'.tr, style: TextStyles.text),
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
                    CardApp(
                      width: 40.w,
                      constraints: BoxConstraints(minHeight: 40.w),
                      margin: EdgeInsets.only(right: Insets.med),
                      padding: EdgeInsets.all(Insets.xs),
                      isShowShadows: true,
                      shadows: Shadows.shadowsUp,
                      radius: 10.w,
                      child: Image.asset(
                        AppAsset.logoAirline(
                          controller
                              .cDestination.destinationTicket.value.airlineCode,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller
                              .cDestination.destinationTicket.value.airlineName,
                          style: TextStyles.title.copyWith(fontSize: 12.w),
                        ),
                        Text(
                          controller
                              .cDestination.destinationTicket.value.airlineCode,
                          style: TextStyles.desc,
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(Insets.xs),
                const Divider(color: AppColor.primaryColor2, thickness: 1),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.cDestination.destinationTicket.value
                                .departureSchedule,
                            style: TextStyles.title.copyWith(fontSize: 12.w),
                          ),
                          verticalSpace(Insets.xs),
                          Text(
                            FormatDateTime.format(
                              value: DateTime.fromMillisecondsSinceEpoch(
                                controller.departureSchedule.value,
                              ),
                              format: DateFormat(
                                'dd MMM yyyy',
                                '${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                              ),
                            ),
                            style: TextStyles.desc,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text('duration'.tr, style: TextStyles.desc),
                        Container(
                          width: 70.w,
                          height: 1.w,
                          color: AppColor.greyColor1,
                        ),
                        Text(
                          FormatDateTime.getDuration(
                            FormatDateTime.getArrivalDate(
                              departureDate:
                                  DateTime.fromMillisecondsSinceEpoch(
                                controller.departureSchedule.value,
                              ),
                              arrivalSchedule: controller.cDestination
                                  .destinationTicket.value.arrivalSchedule,
                            )
                                .difference(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    controller.departureSchedule.value,
                                  ),
                                )
                                .inMinutes,
                          ),
                          style: TextStyles.title.copyWith(fontSize: 12.w),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            controller.cDestination.destinationTicket.value
                                .arrivalSchedule,
                            textAlign: TextAlign.end,
                            style: TextStyles.title.copyWith(fontSize: 12.w),
                          ),
                          verticalSpace(Insets.xs),
                          Text(
                            FormatDateTime.format(
                              value: FormatDateTime.getArrivalDate(
                                departureDate:
                                    DateTime.fromMillisecondsSinceEpoch(
                                  controller.departureSchedule.value,
                                ),
                                arrivalSchedule: controller.cDestination
                                    .destinationTicket.value.arrivalSchedule,
                              ),
                              format: DateFormat(
                                'dd MMM yyyy',
                                '${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                              ),
                            ),
                            textAlign: TextAlign.end,
                            style: TextStyles.desc,
                          ),
                        ],
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
