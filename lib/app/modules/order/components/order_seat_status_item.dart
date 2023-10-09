import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSeatStatusItem extends StatelessWidget {
  const OrderSeatStatusItem({
    super.key,
    required this.color,
    required this.label,
    required this.outlineColor,
  });

  final String label;
  final Color color;
  final Color outlineColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardApp(
          padding: EdgeInsets.zero,
          width: 16.w,
          constraints: BoxConstraints(minHeight: 16.w),
          radius: 4.w,
          isOutlined: true,
          outlineColor: outlineColor,
          color: color,
        ),
        horizontalSpace(Insets.xs),
        Text(label, style: TextStyles.text),
      ],
    );
  }
}
