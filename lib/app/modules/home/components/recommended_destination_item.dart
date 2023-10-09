import 'package:airpedia/app/models/destination_model.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedDestinationItem extends StatelessWidget {
  const RecommendedDestinationItem({
    required this.onTap,
    required this.data,
    this.margin,
    super.key,
  });

  final Function() onTap;
  final DestinationModel data;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        width: 200.w,
        margin: margin,
        isShowShadows: true,
        shadows: Shadows.universal,
        radius: 18.w,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18.w),
                  child: Image.asset(
                    AppAsset.image(data.image),
                    height: 200.w,
                    width: 200.w,
                    fit: BoxFit.cover,
                  ),
                ),
                verticalSpace(Insets.med),
                Text(
                  data.destinationName,
                  style: TextStyles.title.copyWith(fontWeight: FontWeight.w400),
                ),
                Text(
                  data.country,
                  style: TextStyles.text.copyWith(color: AppColor.greyColor1),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 50.w,
                padding: EdgeInsets.symmetric(vertical: 2.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Corners.xsRadius * 2.5,
                    topRight: Corners.xsRadius * 2.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.star, size: 20.w, color: AppColor.yellowColor1),
                    Text('${data.rating}', style: TextStyles.text),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
