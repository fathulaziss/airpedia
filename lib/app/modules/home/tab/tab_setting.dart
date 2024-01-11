import 'package:airpedia/app/modules/home/components/setting_header.dart';
import 'package:airpedia/app/modules/home/components/setting_language_bottomsheet.dart';
import 'package:airpedia/app/modules/home/components/setting_menu.dart';
import 'package:airpedia/app/modules/home/controllers/setting_controller.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/services/app_cycle_service.dart';
import 'package:airpedia/widgets/others/bottomsheet_custom.dart';
import 'package:airpedia/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabSetting extends GetView<SettingController> {
  const TabSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          SettingHeader(data: controller.cUserInfo.dataUser.value),
          SettingMenu(
            icon: Icons.person_rounded,
            label: 'editProfile'.tr,
            onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
          ),
          SettingMenu(
            icon: Icons.lock_open,
            label: 'changePassword'.tr,
            onTap: () {
              showPopUpInfo(
                title: 'information'.tr,
                description: 'underDevelopment'.tr,
              );
            },
          ),
          SettingMenu(
            icon: Icons.pin,
            label: 'changePin'.tr,
            onTap: () {
              showPopUpInfo(
                title: 'information'.tr,
                description: 'underDevelopment'.tr,
              );
            },
          ),
          SettingMenu(
            icon: Icons.translate,
            label: 'changeLanguage'.tr,
            onTap: () {
              BottomSheetCustom(
                context: context,
                initialChildSize: 0.31,
                child: const SettingLanguageBottomsheet(),
              ).showData();
            },
          ),
          SettingMenu(
            icon: Icons.power_settings_new,
            label: 'signOut'.tr,
            onTap: () {
              showPopUpConfirmation(
                title: 'confirmation'.tr,
                description: 'exitApp'.tr,
                onPressPositive: () => AppCycleService().onUserLogout(),
                labelButtonPostive: 'yes'.tr.toUpperCase(),
                labelButtonNegative: 'cancel'.tr.toUpperCase(),
              );
            },
          ),
        ],
      );
    });
  }
}
