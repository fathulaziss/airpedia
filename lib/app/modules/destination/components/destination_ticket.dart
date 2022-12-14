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
      if (controller.isLoadingDestinationTicket.value) {
        return Center(child: LoadingIndicatorBounce(size: 25.w));
      } else if (controller.listDestinationTicket.isNotEmpty) {
        return ListView.builder(
          itemCount: controller.listDestinationTicket.length,
          itemBuilder: (context, index) {
            final data = controller.listDestinationTicket[index];
            return Obx(() {
              return DestinationTicketItem(
                data: data,
                isSelect: data == controller.destinationTicket.value,
                onTap: () => controller.setDestinationTicket(data),
              );
            });
          },
        );
      } else {
        return const DestinationTicketEmpty();
      }
    });
  }
}
