import 'package:airpedia/app/modules/home/controllers/home_controller.dart';
import 'package:airpedia/app/modules/home/tab/tab_history.dart';
import 'package:airpedia/app/modules/home/tab/tab_home.dart';
import 'package:airpedia/app/modules/home/tab/tab_setting.dart';
import 'package:airpedia/app/modules/home/tab/tab_ticket.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/others/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFFFAFAFA),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: AppColor.primaryColor,
          onPressed: () => Get.toNamed(Routes.TOPUP),
          child: Image.asset(
            AppAsset.icon('ic_topup.png'),
            width: 30.w,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.grey.shade300,
          height: 60,
          elevation: 10,
          notchMargin: 10,
          padding: EdgeInsets.zero,
          child: CustomBottomNavBar(
            selectedIndex: controller.selectedPage.value,
            onTap: controller.navigation,
          ),
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
