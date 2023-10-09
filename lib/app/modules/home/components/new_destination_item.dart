import 'package:airpedia/app/models/destination_model.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewDestinationItem extends StatelessWidget {
  const NewDestinationItem({
    super.key,
    required this.data,
    required this.onTap,
    this.margin,
  });

  final Function() onTap;
  final DestinationModel data;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        width: double.infinity,
        margin: margin,
        radius: 18.w,
        isShowShadows: true,
        shadows: Shadows.universal,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.w),
              child: Image.asset(
                AppAsset.image(data.image),
                width: 70.w,
                height: 70.w,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.destinationName,
                    style:
                        TextStyles.title.copyWith(fontWeight: FontWeight.w400),
                  ),
                  verticalSpace(Insets.xs),
                  Text(
                    data.country,
                    style: TextStyles.text.copyWith(color: AppColor.greyColor1),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.star, size: 20.w, color: AppColor.yellowColor1),
                horizontalSpace(2.w),
                Text('${data.rating}', style: TextStyles.text),
              ],
            ),
            horizontalSpace(Insets.xs),
          ],
        ),
      ),
    );
  }
}
