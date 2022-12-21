import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTransactionTicket extends StatelessWidget {
  const CardTransactionTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return CardApp(
      width: 60.w,
      height: 80.w,
      constraints: BoxConstraints(minHeight: 80.w),
      padding: EdgeInsets.all(10.w),
      color: AppColor.primaryColor3,
      radius: 10.w,
      child: Center(
        child: Image.asset(
          AppAsset.icon('ic_plane_white.png'),
          color: AppColor.primaryColor2.withOpacity(0.2),
        ),
      ),
    );
  }
}
