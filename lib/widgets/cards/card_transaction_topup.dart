import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTransactionTopup extends StatelessWidget {
  const CardTransactionTopup({super.key});

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 12.w,
              height: 12.w,
              margin: EdgeInsets.only(right: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFF2CB),
              ),
            ),
            Container(
              width: 20.w,
              height: 20.w,
              margin: EdgeInsets.only(right: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFBD460),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
