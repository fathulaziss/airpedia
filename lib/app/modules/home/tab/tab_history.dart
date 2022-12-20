import 'package:airpedia/app/modules/home/components/history_empty.dart';
import 'package:airpedia/app/modules/home/controllers/history_controller.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:airpedia/widgets/cards/card_wallet.dart';
import 'package:airpedia/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabHistory extends GetView<HistoryController> {
  const TabHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(MediaQuery.of(context).viewPadding.top),
          Padding(
            padding: EdgeInsets.all(Insets.xl),
            child: const CardWallet(),
          ),
          Padding(
            padding: EdgeInsets.only(left: Insets.xl),
            child: Text(
              'Transaction History',
              style: TextStyles.title.copyWith(fontSize: 14.w),
            ),
          ),
          Expanded(
            child: controller.isLoading.value
                ? LoadingIndicatorBounce(size: 25.w)
                : controller.listHistoryTransaction.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.listHistoryTransaction.length,
                        itemBuilder: (context, index) {
                          return CardApp(
                            margin: EdgeInsets.fromLTRB(
                              20.w,
                              10.w,
                              20.w,
                              index ==
                                      controller.listHistoryTransaction.length -
                                          1
                                  ? 75.w
                                  : 10.w,
                            ),
                            color: Colors.amber,
                          );
                        },
                      )
                    : const HistoryEmpty(),
          ),
        ],
      );
    });
  }
}
