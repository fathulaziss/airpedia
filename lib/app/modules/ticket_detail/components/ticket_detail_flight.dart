import 'package:airpedia/app/models/ticket_model.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/utils/format_date_time.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TicketDetailFlight extends StatelessWidget {
  const TicketDetailFlight({super.key, required this.data});

  final TicketModel data;

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
                        AppAsset.logoAirline(data.ticket.airlineCode),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.ticket.airlineName,
                            style: TextStyles.title.copyWith(fontSize: 12.w),
                          ),
                          Text(data.ticket.airlineCode, style: TextStyles.desc),
                        ],
                      ),
                    ),
                    Text(
                      '#${data.refNumber}',
                      style: TextStyles.title.copyWith(fontSize: 12.w),
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
                            data.ticket.departureSchedule,
                            style: TextStyles.title.copyWith(fontSize: 12.w),
                          ),
                          verticalSpace(Insets.xs),
                          Text(
                            FormatDateTime.format(
                              value: DateTime.fromMillisecondsSinceEpoch(
                                data.departureSchedule,
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
                                data.departureSchedule,
                              ),
                              arrivalSchedule: data.ticket.arrivalSchedule,
                            )
                                .difference(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    data.departureSchedule,
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
                            data.ticket.arrivalSchedule,
                            textAlign: TextAlign.end,
                            style: TextStyles.title.copyWith(fontSize: 12.w),
                          ),
                          verticalSpace(Insets.xs),
                          Text(
                            FormatDateTime.format(
                              value: FormatDateTime.getArrivalDate(
                                departureDate:
                                    DateTime.fromMillisecondsSinceEpoch(
                                  data.departureSchedule,
                                ),
                                arrivalSchedule: data.ticket.arrivalSchedule,
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
