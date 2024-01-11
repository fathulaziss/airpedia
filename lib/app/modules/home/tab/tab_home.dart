import 'package:airpedia/app/modules/home/components/home_header.dart';
import 'package:airpedia/app/modules/home/components/new_destination.dart';
import 'package:airpedia/app/modules/home/components/recommended_destination.dart';
import 'package:airpedia/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabHome extends GetView<HomeController> {
  const TabHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flex(
      direction: Axis.vertical,
      children: [
        HomeHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RecommendedDestination(),
                NewDestination(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
