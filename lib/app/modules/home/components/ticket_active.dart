import 'package:airpedia/app/modules/home/components/ticket_empty.dart';
import 'package:airpedia/app/modules/home/components/ticket_item.dart';
import 'package:airpedia/app/modules/home/controllers/ticket_controller.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketActive extends GetView<TicketController> {
  const TicketActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? LoadingIndicatorBounce(size: 25.w)
          : controller.listTicketActive.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.listTicketActive.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom:
                              index == controller.listTicketActive.length - 1
                                  ? 70.w
                                  : 0,
                        ),
                        child: TicketItem(
                          data: controller.listTicketActive[index],
                          onTap: () => Get.toNamed(
                            Routes.TICKET_DETAIL,
                            arguments: {
                              'data': controller.listTicketActive[index],
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              : TicketEmpty(desc: 'dontHaveTicket'.tr);
    });
  }
}
