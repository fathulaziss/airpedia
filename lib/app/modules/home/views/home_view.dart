import 'package:airpedia/app/modules/home/controllers/home_controller.dart';
import 'package:airpedia/app/modules/home/tab/tab_history.dart';
import 'package:airpedia/app/modules/home/tab/tab_home.dart';
import 'package:airpedia/app/modules/home/tab/tab_setting.dart';
import 'package:airpedia/app/modules/home/tab/tab_ticket.dart';
import 'package:airpedia/widgets/others/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: controller.selectedPage.value,
          onTap: (index) {
            controller.navigation(index);
          },
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            TabHome(),
            TabTicket(),
            TabHistory(),
            TabSetting(),
          ],
        ),
      );
    });
  }
}
