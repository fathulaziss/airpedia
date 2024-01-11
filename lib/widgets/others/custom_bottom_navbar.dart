import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });
  final int selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ItemNavbar(
            isSelected: selectedIndex == 0,
            label: 'home'.tr,
            assetIcon: AppAsset.icon('ic_home.png'),
            onTap: () => onTap(0),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 1,
            label: 'ticket'.tr,
            assetIcon: AppAsset.icon('ic_ticket.png'),
            onTap: () => onTap(1),
          ),
          SizedBox(width: Get.width / 5),
          ItemNavbar(
            isSelected: selectedIndex == 2,
            label: 'history'.tr,
            assetIcon: AppAsset.icon('ic_history.png'),
            onTap: () => onTap(2),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 3,
            label: 'setting'.tr,
            assetIcon: AppAsset.icon('ic_setting.png'),
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class ItemNavbar extends StatelessWidget {
  const ItemNavbar({
    super.key,
    required this.isSelected,
    required this.label,
    this.assetIcon = '',
    this.onTap,
    this.icon,
  });

  final bool isSelected;
  final String label;
  final String assetIcon;
  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: Get.width / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSelected ? 22.w : 20.w,
              height: isSelected ? 22.w : 20.w,
              child: assetIcon.isNotEmpty
                  ? Image.asset(
                      assetIcon,
                      color: isSelected ? AppColor.primaryColor : Colors.grey,
                    )
                  : Icon(
                      icon,
                      color: isSelected ? AppColor.primaryColor : Colors.grey,
                      size: isSelected ? 22.w : 20.w,
                    ),
            ),
            verticalSpace(Insets.xs),
            Text(
              label,
              style: TextStyles.desc.copyWith(
                fontSize: 10.w,
                color: isSelected ? AppColor.primaryColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
