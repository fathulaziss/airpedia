import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinNumpadButton extends StatelessWidget {
  const PinNumpadButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Insets.med),
      child: (text.isNotEmpty)
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(Insets.med),
                backgroundColor: Colors.white,
                elevation: 2,
                shadowColor: AppColor.primaryColor.withOpacity(0.2),
                shape: const CircleBorder(),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyles.title.copyWith(fontSize: 24.w),
                ),
              ),
            )
          : IconButton(
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              icon: Icon(
                Icons.backspace_outlined,
                color: Colors.black,
                size: 28.w,
              ),
            ),
    );
  }
}
