import 'package:airpedia/app/modules/home/components/tab_home_header.dart';
import 'package:airpedia/services/app_cycle_service.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/utils/regex.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabHome extends StatelessWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        24.w,
        MediaQuery.of(context).viewPadding.top,
        24.w,
        0,
      ),
      child: Column(
        children: [
          const TabHomeHeader(),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: ButtonPrimary(
              label: 'Logout',
              onTap: () {
                AppCycleService().onUserLogout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
