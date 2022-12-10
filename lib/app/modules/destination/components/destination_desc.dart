import 'package:airpedia/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DestinationDesc extends StatelessWidget {
  const DestinationDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: Insets.xl),
    );
  }
}
