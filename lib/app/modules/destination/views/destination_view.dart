import 'package:airpedia/app/modules/destination/components/destination_button.dart';
import 'package:airpedia/app/modules/destination/components/destination_detail.dart';
import 'package:airpedia/app/modules/destination/components/destination_header.dart';
import 'package:airpedia/app/modules/destination/components/destination_ticket_form.dart';
import 'package:airpedia/app/modules/destination/controllers/destination_controller.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/others/bottomsheet_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DestinationView extends GetView<DestinationController> {
  const DestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DestinationButton(
        onTap: () {
          BottomSheetCustom(
            context: context,
            initialChildSize: 0.75,
            child: const DestinationTicketForm(),
            buttonBottom: Obx(
              () => ButtonPrimary(
                onTap: () {},
                label: 'Search Flight',
                enabled: controller.isValidTicketForm.value,
              ),
            ),
          ).showData();
        },
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 360.w,
            toolbarHeight: 270.w,
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            flexibleSpace: DestinationHeader(data: controller.data.value),
          ),
          SliverToBoxAdapter(
            child: DestinationDetail(data: controller.data.value),
          )
        ],
      ),
    );
  }
}
