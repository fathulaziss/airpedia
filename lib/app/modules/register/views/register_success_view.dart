import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/cards/card_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterSuccessView extends StatelessWidget {
  const RegisterSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          24.w,
          MediaQuery.of(context).viewPadding.top,
          24.w,
          0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CardWallet(name: 'MUHAMAD FATHUL AZIS'),
            verticalSpace(Insets.lg),
            Text(
              'Big Bonus 🎉',
              style: TextStyles.title
                  .copyWith(fontSize: 18.w, color: Colors.black),
            ),
            verticalSpace(Insets.xs),
            Text(
              'We give you early balance so that you can try our services',
              textAlign: TextAlign.center,
              style: TextStyles.text.copyWith(color: AppColor.greyColor1),
            ),
            verticalSpace(Insets.lg),
            ButtonPrimary(
              onTap: () {},
              label: 'Start Now',
              width: 200.w,
            ),
          ],
        ),
      ),
    );
  }
}
