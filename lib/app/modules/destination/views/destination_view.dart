import 'package:airpedia/app/modules/destination/components/destination_desc.dart';
import 'package:airpedia/app/modules/destination/components/destination_header.dart';
import 'package:airpedia/app/modules/destination/controllers/destination_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DestinationView extends GetView<DestinationController> {
  const DestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 350.w,
            toolbarHeight: 250.w,
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            flexibleSpace: const DestinationHeader(),
          ),
          const SliverToBoxAdapter(child: DestinationDesc())
        ],
      ),
    );
  }
}
