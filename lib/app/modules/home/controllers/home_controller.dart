import 'package:airpedia/app/controllers/user_info_controller.dart';
import 'package:airpedia/app/data/destination_data.dart';
import 'package:airpedia/app/models/destination_model.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  PageController pageController = PageController();
  RxInt selectedPage = 0.obs;

  RxList<DestinationModel> listRecommendedDestination =
      <DestinationModel>[].obs;
  RxBool isLoadingRecommendedDestination = false.obs;

  RxList<DestinationModel> listNewDestination = <DestinationModel>[].obs;
  RxBool isLoadingNewDestination = false.obs;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args != null) {
      final pageIndex = args['index'];
      pageController = PageController(initialPage: pageIndex);
      selectedPage(pageIndex);
    }
    cUserInfo.getDataUser();
    getRecommendedDestination();
    getNewDestination();
    super.onInit();
  }

  void navigation(int index) {
    selectedPage(index);
    pageController.jumpToPage(index);
  }

  Future<void> getRecommendedDestination() async {
    try {
      isLoadingRecommendedDestination(true);

      await Future.delayed(const Duration(seconds: 2));

      listRecommendedDestination(
        RxList.from(
          recommendedDestination.map((e) => DestinationModel.fromJson(e)),
        ),
      );

      listRecommendedDestination.sort((a, b) => b.rating.compareTo(a.rating));

      isLoadingRecommendedDestination(false);
    } catch (e) {
      isLoadingRecommendedDestination(false);
      logSys(e.toString());
    }
  }

  Future<void> getNewDestination() async {
    try {
      isLoadingNewDestination(true);

      await Future.delayed(const Duration(seconds: 2));

      listNewDestination(
        RxList.from(newDestination.map((e) => DestinationModel.fromJson(e))),
      );

      listNewDestination.sort((a, b) => b.rating.compareTo(a.rating));

      isLoadingNewDestination(false);
    } catch (e) {
      isLoadingNewDestination(false);
      logSys(e.toString());
    }
  }
}
