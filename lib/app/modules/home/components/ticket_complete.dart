import 'package:airpedia/app/modules/home/components/ticket_empty.dart';
import 'package:airpedia/app/modules/home/controllers/ticket_controller.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:airpedia/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketComplete extends GetView<TicketController> {
  const TicketComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? LoadingIndicatorBounce(size: 25.w)
          : controller.listTicketComplete.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.listTicketComplete.length,
                  itemBuilder: (context, index) {
                    return const CardApp(color: Colors.amber);
                  },
                )
              : const TicketEmpty();
    });
  }
}
