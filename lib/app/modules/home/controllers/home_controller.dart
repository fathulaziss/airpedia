import 'package:airpedia/app/controllers/user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  final pageController = PageController();
  RxInt selectedPage = 0.obs;

  @override
  void onInit() {
    cUserInfo.getDataUser();
    super.onInit();
  }

  void navigation(int index) {
    selectedPage(index);
    pageController.jumpToPage(index);
  }
}
