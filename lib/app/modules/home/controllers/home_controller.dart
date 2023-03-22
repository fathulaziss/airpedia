import 'package:airpedia/app/controllers/user_info_controller.dart';
import 'package:airpedia/app/data/destination_data.dart';
import 'package:airpedia/app/models/destination_model.dart';
import 'package:airpedia/app/modules/home/controllers/history_controller.dart';
import 'package:airpedia/app/modules/home/controllers/ticket_controller.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();
  final cTicket = Get.find<TicketController>();
  final cHistory = Get.find<HistoryController>();

  PageController pageController = PageController();
  RxInt selectedPage = 0.obs;

  RxBool isLoadingDataUser = false.obs;

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
      switch (pageIndex) {
        case 1:
          cTicket.getTicket();
          break;
      }
    }
    getDataUser();
    getRecommendedDestination();
    getNewDestination();
    super.onInit();
  }

  void navigation(int index) {
    selectedPage(index);
    pageController.jumpToPage(index);

    switch (index) {
      case 1:
        cTicket.getTicket();
        break;
      case 2:
        cHistory.getHistoryTransaction();
        break;
    }
  }

  Future<void> getDataUser() async {
    try {
      isLoadingDataUser(true);

      await cUserInfo.getDataUser();
      await Future.delayed(const Duration(seconds: 2));

      isLoadingDataUser(false);
    } catch (e) {
      isLoadingDataUser(false);
      logSys(e.toString());
    }
  }

  Future<void> getRecommendedDestination() async {
    try {
      isLoadingRecommendedDestination(true);

      await Future.delayed(const Duration(seconds: 2));

      listRecommendedDestination(
        RxList.from(
          recommendedDestination.map(DestinationModel.fromJson),
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
        RxList.from(newDestination.map(DestinationModel.fromJson)),
      );

      listNewDestination.sort((a, b) => b.rating.compareTo(a.rating));

      isLoadingNewDestination(false);
    } catch (e) {
      isLoadingNewDestination(false);
      logSys(e.toString());
    }
  }
}
