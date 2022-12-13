import 'package:airpedia/app/modules/destination/controllers/destination_controller.dart';
import 'package:airpedia/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DestinationTicket extends GetView<DestinationController> {
  const DestinationTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoadingDestinationTicket.value
          ? const Center(child: LoadingIndicatorBounce())
          : ListView.builder(
              itemCount: controller.listDestinationTicket.length,
              itemBuilder: (context, index) {
                return Text(
                  controller
                      .listDestinationTicket[index].airportArrivalLocation,
                );
              },
            );
    });
  }
}
