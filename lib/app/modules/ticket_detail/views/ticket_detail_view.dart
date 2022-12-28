import 'package:airpedia/app/modules/ticket_detail/components/ticket_detail_facilities.dart';
import 'package:airpedia/app/modules/ticket_detail/components/ticket_detail_flight.dart';
import 'package:airpedia/app/modules/ticket_detail/components/ticket_detail_header.dart';
import 'package:airpedia/app/modules/ticket_detail/components/ticket_detail_price.dart';
import 'package:airpedia/app/modules/ticket_detail/controllers/ticket_detail_controller.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketDetailView extends GetView<TicketDetailController> {
  const TicketDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'ticketDetail'.tr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.xl),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TicketDetailHeader(data: controller.data.value),
              TicketDetailFlight(data: controller.data.value),
              TicketDetailFacilities(data: controller.data.value),
              TicketDetailPrice(data: controller.data.value),
            ],
          ),
        ),
      ),
    );
  }
}
