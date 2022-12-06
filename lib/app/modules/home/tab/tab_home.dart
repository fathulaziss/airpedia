import 'package:airpedia/app/modules/home/components/home_header.dart';
import 'package:airpedia/app/modules/home/components/new_destination.dart';
import 'package:airpedia/app/modules/home/components/recommended_destination.dart';
import 'package:airpedia/app/modules/home/controllers/home_controller.dart';
import 'package:airpedia/services/app_cycle_service.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabHome extends GetView<HomeController> {
  const TabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20.w,
        MediaQuery.of(context).viewPadding.top,
        20.w,
        0,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            verticalSpace(Insets.lg),
            const RecommendedDestination(),
            const NewDestination(),
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
      ),
    );
  }
}
