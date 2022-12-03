import 'package:airpedia/app/controllers/user_info_controller.dart';
import 'package:airpedia/app/data/destination_data.dart';
import 'package:airpedia/app/models/destination_model.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  final pageController = PageController();
  RxInt selectedPage = 0.obs;

  RxList<DestinationModel> listRecommendedDestination =
      <DestinationModel>[].obs;

  @override
  void onInit() {
    cUserInfo.getDataUser();
    getRecommendedDestination();
    super.onInit();
  }

  void navigation(int index) {
    selectedPage(index);
    pageController.jumpToPage(index);
  }

  Future<void> getRecommendedDestination() async {
    try {
      logSys('onloading');
      await Future.delayed(const Duration(seconds: 2));
      listRecommendedDestination(
        RxList.from(
          recommendedDestination.map((e) => DestinationModel.fromJson(e)),
        ),
      );
      logSys('offloading');
    } catch (e) {
      logSys(e.toString());
    }
  }
}
