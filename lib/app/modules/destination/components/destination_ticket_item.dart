import 'dart:math' as math;

import 'package:airpedia/app/models/destination_ticket_model.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/utils/format_currency.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationTicketItem extends StatelessWidget {
  const DestinationTicketItem({
    super.key,
    required this.data,
    this.isSelect = false,
    required this.onTap,
  });

  final DestinationTicketModel data;
  final bool isSelect;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        radius: 12.w,
        margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
        isShowShadows: true,
        shadows: Shadows.shadowsUp,
        isOutlined: true,
        outlineColor: isSelect ? AppColor.primaryColor : Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.airlineName,
              style: TextStyles.title.copyWith(fontSize: 12.w),
            ),
            verticalSpace(Insets.sm),
            Row(
              children: [
                CardApp(
                  width: 40.w,
                  constraints: BoxConstraints(minHeight: 40.w),
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.all(Insets.xs),
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
                                    TextStyles.title.copyWith(fontSize: 12.w),
                              ),
                              Text(
                                data.airportDepartureCode.toUpperCase(),
                                style: TextStyles.desc
                                    .copyWith(color: AppColor.greyColor1),
                              ),
                            ],
                          ),
                          horizontalSpace(Insets.xs),
                          Row(
                            children: [
                              CardApp(
                                padding: EdgeInsets.zero,
                                width: MediaQuery.of(context).size.width / 10,
                                constraints: BoxConstraints(minHeight: 2.w),
                                color: AppColor.primaryColor2,
                              ),
                              horizontalSpace(Insets.xs),
                              Transform.rotate(
                                angle: 180 * math.pi / 360,
                                child: Icon(
                                  Icons.airplanemode_active,
                                  size: 16.w,
                                  color: AppColor.primaryColor3,
                                ),
                              ),
                            ],
                          ),
                          horizontalSpace(Insets.xs),
                          Column(
                            children: [
                              Text(
                                data.arrivalSchedule,
                                style:
                                    TextStyles.title.copyWith(fontSize: 12.w),
                              ),
                              Text(
                                data.airportArrivalCode.toUpperCase(),
                                style: TextStyles.desc
                                    .copyWith(color: AppColor.greyColor1),
                              ),
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
                      .copyWith(fontSize: 12.w, color: AppColor.primaryColor),
                ),
              ],
            ),
            const Divider(color: AppColor.primaryColor2, thickness: 1),
            Wrap(
              runSpacing: 4.w,
              children: [
                ...data.benefit.map((e) {
                  return Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: SizedBox(
                      width: 97.w,
                      child: Row(
                        children: [
                          Image.asset(
                            AppAsset.icon('ic_check.png'),
                            width: 10.w,
                          ),
                          horizontalSpace(Insets.xs),
                          Text(
                            e,
                            style: TextStyles.desc.copyWith(fontSize: 10.w),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
