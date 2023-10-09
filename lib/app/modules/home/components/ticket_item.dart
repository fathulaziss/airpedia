import 'dart:math' as math;
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

class TicketItem extends StatelessWidget {
  const TicketItem({super.key, required this.data, required this.onTap});

  final TicketModel data;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        radius: 16.w,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
        isShowShadows: true,
        shadows: Shadows.shadowsUp,
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
                        '#${data.refNumber}',
                        style: TextStyles.title.copyWith(fontSize: 12.w),
                      ),
                      Text(data.ticket.airlineCode, style: TextStyles.desc),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                      style:
                          TextStyles.desc.copyWith(color: AppColor.greyColor1),
                    ),
                    CardApp(
                      constraints: BoxConstraints(minHeight: 20.w),
                      padding: EdgeInsets.symmetric(horizontal: Insets.med),
                      color: DateTime.fromMillisecondsSinceEpoch(
                                data.departureSchedule,
                              ).isAfter(DateTime.now()) ==
                              true
                          ? AppColor.yellowColor1
                          : AppColor.greenColor,
                      radius: 4.w,
                      child: Center(
                        child: Text(
                          DateTime.fromMillisecondsSinceEpoch(
                                    data.departureSchedule,
                                  ).isAfter(DateTime.now()) ==
                                  true
                              ? 'onGoing'.tr
                              : 'used'.tr,
                          style: TextStyles.title
                              .copyWith(fontSize: 12.w, color: Colors.white),
                        ),
                      ),
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
                        data.ticket.airportDepartureCode.toUpperCase(),
                        style: TextStyles.desc,
                      ),
                      Text(
                        data.ticket.departureSchedule,
                        style: TextStyles.title.copyWith(fontSize: 12.w),
                      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80.w,
                          height: 1.w,
                          margin: EdgeInsets.only(right: Insets.sm),
                          color: AppColor.primaryColor2,
                        ),
                        Transform.rotate(
                          angle: 180 * math.pi / 360,
                          child: Icon(
                            Icons.airplanemode_active,
                            size: 14.w,
                            color: AppColor.primaryColor3,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      FormatDateTime.getDuration(
                        FormatDateTime.getArrivalDate(
                          departureDate: DateTime.fromMillisecondsSinceEpoch(
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
                        data.ticket.airportArrivalCode.toUpperCase(),
                        style: TextStyles.desc,
                      ),
                      Text(
                        data.ticket.arrivalSchedule,
                        textAlign: TextAlign.end,
                        style: TextStyles.title.copyWith(fontSize: 12.w),
                      ),
                      Text(
                        FormatDateTime.format(
                          value: FormatDateTime.getArrivalDate(
                            departureDate: DateTime.fromMillisecondsSinceEpoch(
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
    );
  }
}
