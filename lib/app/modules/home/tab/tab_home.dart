import 'package:airpedia/app/modules/home/components/home_header.dart';
import 'package:airpedia/app/modules/home/components/new_destination.dart';
import 'package:airpedia/app/modules/home/components/recommended_destination.dart';
import 'package:airpedia/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabHome extends GetView<HomeController> {
  const TabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        const HomeHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
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
