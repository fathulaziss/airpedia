import 'package:airpedia/app/models/airport_model.dart';
import 'package:airpedia/app/modules/destination/controllers/destination_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/widgets/inputs/input_date.dart';
import 'package:airpedia/widgets/inputs/input_search_dropdown.dart';
import 'package:airpedia/widgets/others/input_search_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DestinationTicketForm extends GetView<DestinationController> {
  const DestinationTicketForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputDate(
          label: 'chooseDepartureDateLabel'.tr,
          hint: 'DD/MM/YYYY',
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: Insets.sm),
            child: Icon(
              Icons.calendar_month,
              size: 24.w,
              color: AppColor.primaryColor,
            ),
          ),
          controller: controller.cDateDeparture,
          value: controller.setDateDeparture,
        ),
        InputSearchDropdown(
          label: 'chooseDepartureAirportLabel'.tr,
          hint: 'chooseDepartureAirportHint'.tr,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: Insets.sm),
            child: Icon(
              Icons.search,
              size: 24.w,
              color: AppColor.primaryColor,
            ),
          ),
          suggestionsCallback: (value) {
            return controller.searchAirportDeparture(keyword: value);
          },
          controller: controller.cAirportDeparture,
          itemBuilder: (context, value) {
            final data = value as AirportModel;
            return InputSearchDropdonwItem(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      data.code.toUpperCase(),
                      style: TextStyles.text.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    '- ',
                    style: TextStyles.text.copyWith(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      data.name,
                      style: TextStyles.text.copyWith(color: Colors.white),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          },
          onSelected: (value) {
            final data = value as AirportModel;
            controller.setAirportDeparture(data);
          },
        ),
      ],
    );
  }
}
