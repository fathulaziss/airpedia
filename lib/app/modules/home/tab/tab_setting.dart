import 'package:airpedia/app/modules/home/components/setting_header.dart';
import 'package:airpedia/app/modules/home/components/setting_menu.dart';
import 'package:airpedia/app/modules/home/controllers/setting_controller.dart';
import 'package:airpedia/services/app_cycle_service.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabSetting extends GetView<SettingController> {
  const TabSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingHeader(data: controller.cUserInfo.dataUser.value),
        SettingMenu(
          icon: const Icon(Icons.person_rounded, color: AppColor.yellowColor3),
          label: 'Edit Profile',
          onTap: () {},
        ),
        SettingMenu(
          icon: const Icon(Icons.lock_open, color: AppColor.yellowColor3),
          label: 'Change Password',
          onTap: () {},
        ),
        SettingMenu(
          icon: const Icon(Icons.pin, color: AppColor.yellowColor3),
          label: 'Change PIN',
          onTap: () {},
        ),
        SettingMenu(
          icon: const Icon(
            Icons.power_settings_new,
            color: AppColor.yellowColor3,
          ),
          label: 'Sign Out',
          onTap: () {
            showPopUpConfirmation(
              title: 'Confirmation',
              description: 'Are you sure to exit application ?',
              onPressPositive: () => AppCycleService().onUserLogout(),
            );
          },
        ),
      ],
    );
  }
}
