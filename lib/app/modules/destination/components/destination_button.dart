import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DestinationButton extends StatelessWidget {
  const DestinationButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CardApp(
      height: 90.w,
      radius: 0,
      padding: EdgeInsets.all(Insets.xl),
      isShowShadows: true,
      shadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 5,
          offset: const Offset(0, 5),
        ),
      ],
      child: ButtonPrimary(onTap: onTap, label: 'bookNow'.tr),
    );
  }
}
