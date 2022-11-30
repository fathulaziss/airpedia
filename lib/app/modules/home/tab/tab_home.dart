import 'package:airpedia/services/app_cycle_service.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabHome extends StatelessWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Tab Home is Working'),
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
    );
  }
}
