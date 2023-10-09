import 'package:airpedia/app/data/nominal_topup_data.dart';
import 'package:airpedia/app/modules/topup/components/topup_item.dart';
import 'package:airpedia/app/modules/topup/controllers/topup_controller.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/format_currency.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/inputs/input_currency.dart';
import 'package:airpedia/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopupView extends GetView<TopupController> {
  const TopupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageDefault(
          title: 'topup'.tr,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(Insets.xl),
                InputCurrency(
                  label: 'Nominal ${'topup'.tr}',
                  hint: '0',
                  controller: controller.cNominal,
                  value: controller.setNominal,
                  validation: (value) {
                    final convertValue = int.parse(value.replaceAll('.', ''));
                    if (convertValue >= 10000) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  validationText: 'Minimal nominal ${priceFormat(10000)}',
                ),
                verticalSpace(Insets.lg),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: Colors.black, thickness: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Insets.sm),
                      child: Text(
                        '${'choose'.tr} Nominal',
                        style: TextStyles.text,
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: Colors.black, thickness: 1),
                    ),
                  ],
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 20.w),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: nominalTopupData.length,
                  itemBuilder: (context, index) {
                    return TopUpItem(
                      data: nominalTopupData[index],
                      onTap: () {
                        controller.chooseNominal(nominalTopupData[index]);
                      },
                    );
                  },
                ),
                verticalSpace(Insets.lg),
                ButtonPrimary(
                  label: 'topup'.tr,
                  onTap: controller.submit,
                  enabled: controller.isValidNominal.value,
                  isLoading: controller.isLoading.value,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
