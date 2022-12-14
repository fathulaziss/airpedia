import 'dart:math' as math;

import 'package:airpedia/app/models/destination_ticket_model.dart';
import 'package:airpedia/app/modules/destination/controllers/destination_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/utils/format_currency.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DestinationTicketItem extends GetView<DestinationController> {
  const DestinationTicketItem({
    super.key,
    required this.data,
    required this.onTap,
  });

  final DestinationTicketModel data;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        child: CardApp(
          radius: 10.w,
          margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.w),
          isShowShadows: true,
          shadows: Shadows.shadowsUp,
          isOutlined: true,
          outlineColor: data == controller.destinationTicket.value
              ? AppColor.primaryColor
              : Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.airlineName,
                style: TextStyles.title.copyWith(fontSize: 14.w),
              ),
              verticalSpace(Insets.sm),
              Row(
                children: [
                  CardApp(
                    width: 50.w,
                    constraints: BoxConstraints(minHeight: 50.w),
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.all(4.w),
                    isShowShadows: true,
                    shadows: Shadows.shadowsUp,
                    radius: 10.w,
                    child: Image.asset(
                      AppAsset.logoAirline(data.airlineCode),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  data.departureSchedule,
                                  style:
                                      TextStyles.title.copyWith(fontSize: 14.w),
                                ),
                                Text(
                                  data.airportDepartureCode.toUpperCase(),
                                  style: TextStyles.text
                                      .copyWith(color: AppColor.greyColor1),
                                )
                              ],
                            ),
                            horizontalSpace(4.w),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.zero,
                                  width: MediaQuery.of(context).size.width / 10,
                                  height: 2.w,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                horizontalSpace(4.w),
                                Transform.rotate(
                                  angle: 180 * math.pi / 360,
                                  child: Icon(
                                    Icons.airplanemode_active,
                                    size: 16.w,
                                  ),
                                )
                              ],
                            ),
                            horizontalSpace(4.w),
                            Column(
                              children: [
                                Text(
                                  data.arrivalSchedule,
                                  style:
                                      TextStyles.title.copyWith(fontSize: 14.w),
                                ),
                                Text(
                                  data.airportArrivalCode.toUpperCase(),
                                  style: TextStyles.text
                                      .copyWith(color: AppColor.greyColor1),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    priceFormat(data.price),
                    style: TextStyles.title
                        .copyWith(fontSize: 14.w, color: AppColor.primaryColor),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
