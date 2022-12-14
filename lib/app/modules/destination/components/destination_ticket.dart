import 'package:airpedia/app/modules/destination/components/destination_ticket_empty.dart';
import 'package:airpedia/app/modules/destination/components/destination_ticket_item.dart';
import 'package:airpedia/app/modules/destination/controllers/destination_controller.dart';
import 'package:airpedia/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DestinationTicket extends GetView<DestinationController> {
  const DestinationTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoadingDestinationTicket.value
          ? Center(child: LoadingIndicatorBounce(size: 25.w))
          : controller.listDestinationTicket.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.listDestinationTicket.length,
                  itemBuilder: (context, index) {
                    final data = controller.listDestinationTicket[index];
                    return DestinationTicketItem(
                      data: data,
                      onTap: () {
                        controller.setDestinationTicket(data);
                      },
                    );
                  },
                )
              : const DestinationTicketEmpty();
    });
  }
}
