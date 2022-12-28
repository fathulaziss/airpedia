import 'package:airpedia/app/models/history_model.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/format_currency.dart';
import 'package:airpedia/utils/format_date_time.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:airpedia/widgets/cards/card_transaction_ticket.dart';
import 'package:airpedia/widgets/cards/card_transaction_topup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.data});

  final HistoryModel data;

  @override
  Widget build(BuildContext context) {
    return CardApp(
      margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.w),
      radius: 16.w,
      isShowShadows: true,
      shadows: Shadows.shadowsUp,
      child: Row(
        children: [
          if (data.transactionType == 'Ticket')
            const CardTransactionTicket()
          else
            const CardTransactionTopup(),
          horizontalSpace(Insets.sm),
          Expanded(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.transactionType == 'Ticket'
                      ? data.title.replaceAll(RegExp('Ticket'), 'ticket'.tr)
                      : data.title.replaceAll(RegExp('Top Up'), 'topup'.tr),
                  style: TextStyles.title.copyWith(fontSize: 12.w),
                ),
                verticalSpace(Insets.xs),
                Text(
                  priceFormat(data.amount),
                  style: (data.transactionType == 'Ticket')
                      ? TextStyles.title
                          .copyWith(fontSize: 12.w, color: AppColor.redColor)
                      : TextStyles.title
                          .copyWith(fontSize: 12.w, color: AppColor.greenColor),
                ),
                verticalSpace(Insets.xs),
                Text(
                  FormatDateTime.format(
                    format: DateFormat(
                      'dd MMM yyyy',
                      '${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                    ),
                    value: data.transactionDate,
                  ),
                  style: TextStyles.desc.copyWith(color: AppColor.greyColor1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
